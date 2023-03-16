#!/usr/bin/env bash
mkdir -p outputs/jlc
kikit fab jlcpcb --missingWarn --schematic connector-pcb.kicad_sch --assembly --field "LCSC#" connector-pcb.kicad_pcb outputs/jlc
kicad-cli sch export pdf -o outputs/schematic.pdf connector-pcb.kicad_sch
kicad-cli sch export python-bom -o outputs/bom.xml connector-pcb.kicad_sch
/usr/bin/python3 "/usr/share/kicad/plugins/bom_csv_grouped_by_value.py" outputs/bom.xml "outputs/bom.csv"
