.segment "HEADER"
.byte "NES", $1a    ; magic string that always begins an iNES header 
.byte $02           ; number of 16kb PRG-ROM banks
.byte $01           ; number of 8kb CHR-ROM banks
.byte %00000001     ; vertical mirroring, no save RAM, no mapper
.byte %00000000     ; no special-case flags set, no mapper
.byte $00           ; no PRG-RAM present
.byte $00           ; NTSC format