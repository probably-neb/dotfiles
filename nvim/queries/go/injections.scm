; (call_expression
;     (identifier) @_function (#eq? @_function "html")
;    (argument_list (raw_string_literal) @injection.content (#set! injection.language "html"))
; )

(call_expression
    (identifier) @injection.language (#eq? @injection.language "html")
   (argument_list (raw_string_literal) @injection.content )
) @func
