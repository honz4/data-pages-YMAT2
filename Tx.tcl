#!/usr/bin/tclsh
#rozseka ypr.txt na jednotlive T*.txt

set fypr [open ypr.txt r]
fconfigure $fypr  -encoding utf-8
fconfigure stdout -encoding utf-8

while {1} {
  gets $fypr line
  if {[eof $fypr]} break
  if {[regexp {^(T\d+):\s*(.*)$} $line x T heading]} {
    catch {close $ftxt}
    set filename $T.txt
    puts $line
    if {![file exists $filename ]} { #zaloz
       set ftxt [open $filename w+]
       fconfigure $ftxt -encoding utf-8
       puts $ftxt "======$T======\n$heading"
    }
  } else { #zapisuj do aktualniho T*.txt
    puts append+$line
    catch {puts $ftxt $line}
  }
}
close $fypr
