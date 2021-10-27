# https://forum.denizenscript.com/resources/dcolorengine.41/
# <proc[ColorEngine].context[<color input1>|GRADIENT|<color input2>|<text>]>

Gradient:
    type: procedure
    definitions: start_hex|end_hex|text
    script:
    - if !<color[<[start_hex]>].exists>:
        - determine error
    - if !<color[<[end_hex]>].exists>:
        - determine error
    - define start_hex <color[<[start_hex]>]>
    - define end_hex <color[<[end_hex]>]>
    - define length <[text].length>
    - define delta_red <[end_hex].red.sub[<[start_hex].red>].div[<[length]>]>
    - define delta_blue <[end_hex].blue.sub[<[start_hex].blue>].div[<[length]>]>
    - define delta_green <[end_hex].green.sub[<[start_hex].green>].div[<[length]>]>
    - repeat <[length]>:
        - define red <[start_hex].red.add[<[delta_red].mul[<[value]>]>].round_up>
        - define blue <[start_hex].blue.add[<[delta_blue].mul[<[value]>]>].round_up>
        - define green <[start_hex].green.add[<[delta_green].mul[<[value]>]>].round_up>
        - define output <[output].if_null[]><&color[<color[<[red]>,<[green]>,<[blue]>]>]><[text].char_at[<[value]>]>
    - determine <[output]>
