namespace eval ::echotb {

vsim work.test_tb

if {[file exists wave.do]} {
  do wave.do
}

variable clockPeriod [examine clock_period]

variable clockPeriod [string trim $clockPeriod "{}"]

variable timeUnits [lindex $clockPeriod 1]
variable clockPeriod [lindex $clockPeriod 0]

variable errorCount 0

proc splitOnWhiteSpace {value {min -1} {max -1} {fast False}} {
    if {!([string is integer -strict $min] && [string is integer -strict $max])} {
        error "min and max should both be integers ($min, $max)"
    }
    if {($min < -1) || ($max < -1)} {
        error "min and max should both be >= -1 ($min, $max)"
    }
    if {($max != -1) && ($max < $min)} {
        error "min should be <= max ($min, $max)"
    }
    if {$fast} {
        set splitLst [list {*}[string map {
            \{ \\\{
            \" \\\"
            \\ \\\\
            } $value]]
    } else {
        set splitLst [regexp -all -inline {\S+} $value]
    }
    if {$min != -1} {
        if {$max == -1} {
            set max $min
        }
        set length [llength $splitLst]
        if {($length < $min) || ($length > $max)} {
            if {$min == $max} {
                set msgEnd "$min values"
            } else {
                set msgEnd "between $min and $max values"
            }
            error "'$value' contains $length instead of $msgEnd"
        }
    }
    return $splitLst
}

proc printMsg { msg } {
  global now
  variable timeUnits
  echo $now $timeUnits: $msg
}

proc runClockCycles { count } {
  variable clockPeriod
  variable timeUnits

  set t [expr {$clockPeriod * $count * 2}]
  run $t $timeUnits
}

# Run reset for 1 cycle
runClockCycles 1
force rst 0 -deposit

# Send CNN parameters
set fp [open "input_cnn" r]

force interrupt 1 -deposit
force load_process 0 -deposit
force cnn_image 0 -deposit

while { [gets $fp data] >= 0 } {
  set bit_strings [splitOnWhiteSpace $data]
  foreach i $bit_strings {
    force din $i -deposit
    runClockCycles 1
  }
  force load_process 1
  runClockCycles 1
  force load_process 0
}

close $fp

force interrupt 0 -deposit
runClockCycles 1

# Send Image
set fp [open "input_image" r]

force interrupt 1 -deposit
force load_process 0 -deposit
force cnn_image 1 -deposit

while { [gets $fp data] >= 0 } {
  set bit_strings [splitOnWhiteSpace $data]
  foreach i $bit_strings {
    force din $i -deposit
    runClockCycles 1
  }
  force load_process 1
  runClockCycles 1
  force load_process 0
}

close $fp

force interrupt 0 -deposit
runClockCycles 1

}
