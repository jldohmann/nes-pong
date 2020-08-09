.segment "HEADER"
.byte "NES", 26, 2, 1, 0, 0

.segment "CODE"
.proc irq_handler
  RTI
.endproc

.proc nmi_handler
  RTI
.endproc

.proc reset_handler
  SEI
  CLD
  LDX #$00
  STX $2000
  STX $2001
vblankwait:
  BIT $2002
  BPL vblankwait
  JMP main
.endproc

.proc main
  LDX $2002 ; check status of PPU
  LDX #$3f  ; load the X register with hex value $3f; high byte for PPU palette
  STX $2006
  LDX #$00  ; load the X register with hex value $00; low byte for PPU palette
  STX $2006
  LDA #$0f  ; load accmulator: use this color (black) as bg
  STA $2007
  LDA #%00011110  ; set bit flags; enable fg and bg with corresponding left edges
  STA $2001
forever:
  JMP forever
.endproc

.segment "VECTORS"
.addr nmi_handler, reset_handler, irq_handler

.segment "CHARS"
.res 8192
.segment "STARTUP"