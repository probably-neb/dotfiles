; inject html into html! macros in yew files
(
    (macro_invocation 
        macro: (identifier) @_name (#eq? @_name "html")
        (token_tree) @html ; (#offset! @html 0 1 0 -1 )
    )
)
; do the same thing with css!
( 
    (macro_invocation 
        macro: (identifier) @_name (#eq? @_name "css")
        (token_tree (raw_string_literal) @css (#offset! @css 0 3 0 -2))
    )
)
