module Controller_Tasks();
  task feed_values(input integer size, input integer datasrc);
  begin
    // Feed `size` values to ALU
    ALU_clear <= 0;
    ALU_load <= ALULOAD_VALUES;
    Bus_datasrc <= datasrc;

    // Request bias and weights
    DMA_read <= 1;
    DMA_address <= ADR_LAYER_OUTPUT;
    DMA_count <= 1 + size;

    calc_progress <= 0;
    stage_progress <= stage_progress + 1;
  end
  endtask

  task calc_neuron(input integer size);
  begin
    Neuron_en <= STAGE_UD;

    if (DMA_ready) begin
      // Feed bias and weights to ALU
      ALU_en <= 1;
      ALU_load <= ALULOAD_BIAS_WEIGHTS;
      Bus_datasrc <= BUS_DATASRC_DMA;

      // Request subsequent batch
      DMA_address <= DMA_address + 1 + size;
      DMA_count <= 1 + size;

      Neuron_address <= calc_progress;
    end
  end
  endtask

  task write_neuron(input integer size, input integer layer, input integer next_layer);
  begin
    if (calc_progress != size) begin
      if (ALU_en == 1) begin
        ALU_en <= 0;
        ALU_load <= ALULOAD_UD;
        Neuron_en <= layer;
        // Advance
        calc_progress <= calc_progress + 1;
      end
    end else begin
      stage <= STAGE_LAYER_OUTPUT;
      stage_progress <= 0;
      calc_progress <= 0;

      ALU_en <= 0;
      ALU_clear <= 1;
      ALU_load <= ALULOAD_UD;

      Neuron_en <= STAGE_UD;
    end
  end
  endtask
endmodule