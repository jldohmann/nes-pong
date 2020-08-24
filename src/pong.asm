.include "constants.inc"
.include "header.inc"

.segment "CODE"
.proc irq_handler
  RTI
.endproc

.proc nmi_handler
  RTI
.endproc

.import reset_handler

.export main
.proc main
  LDX PPUSTATUS   ; check status of PPU
  LDX #$3f        ; load the X register with hex value $3f; high byte for PPU palette
  STX PPUADDR
  LDX #$00        ; load the X register with hex value $00; low byte for PPU palette
  STX PPUADDR
  LDA #$0f        ; load accmulator: use this color (black) as bg
  STA PPUDATA
  LDA #%00011110  ; set bit flags; enable fg and bg with corresponding left edges
  STA PPUMASK
forever:
  JMP forever
.endproc

.segment "VECTORS"
.addr nmi_handler, reset_handler, irq_handler

.segment "CHR"
.incbin "pong.chr"
;.res 8192