; inject r into r code blocks
(fenced_code_block
    (_ 
       (language) @_lang (#eq? @_lang "r")
    )
    (code_fence_content) @r
)

(fenced_code_block
    (_ 
       (language) @_lang (#eq? @_lang "python")
    )
    (code_fence_content) @python
)
