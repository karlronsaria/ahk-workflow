#Include %A_ScriptDir%\Monitor.ahk
#Persistent
#SingleInstance Force


;;;;;;;;;;;;;;;;;;;;;
; --- Functions --- ;
;;;;;;;;;;;;;;;;;;;;;


ToList(in_str) {
    position := RegExMatch(in_str, "O)(?<FIRST>-?\d+)..(?<SECND>-?\d+)", match)
    first := match.Value("FIRST")
    secnd := match.Value("SECND")
    
    if (!first or !secnd) {
        return ""
    }
    
    out_str := ""
    number := first
    
    if (first < secnd) {
        while (number <= secnd) {
            out_str .= Format("{1}`r`n", number)
            number := number + 1
        }
    } else {
        while (number >= secnd) {
            out_str .= Format("{1}`r`n", number)
            number := number - 1
        }
    }
    
    return out_str
}

NewMatrix(x, y, payload) {
    mat := []
    
    i := 1
    while (i <= x) {
        mat.Push([])
        j := 1
        while (j <= y) {
            mat[i].Push(payload)
            j := j + 1
        }
        i := i + 1
    }
    
    return mat
}

MatrixToString(mat) {
    str := ""
    i := 1
    while (i <= mat.MaxIndex()) {
        j := 1
        while (j <= mat[i].MaxIndex()) {
            str .= Format("{1} ", mat[i][j])
            j := j + 1
        }
        str .= "`r`n"
        i := i + 1
    }
    return str
}

Min(a, b) {
    if (a < b) {
        return a
    }
    
    return b
}

Combination(n, k) {
    mat := NewMatrix(n + 1, k + 1, 0)
    
    i := 1
    while (i <= mat.MaxIndex()) {
        j := 1
        while (j <= Min(i, k + 1)) {
            if (j = 1 or j = i) {
                mat[i][j] := 1
            } else {
                mat[i][j] := mat[i - 1][j - 1] + mat[i - 1][j]
            }
            j := j + 1
        }
        i := i + 1
    }
    
    return mat[n + 1][k + 1]
}

Arrangement(n, k) {
    mat := NewMatrix(n + 1, k + 1, 0)
    
    i := 1
    while (i <= mat.MaxIndex()) {
        j := 1
        while (j <= Min(i, k + 1)) {
            if (j = 1) {
                mat[i][j] := 1
            } else {
                mat[i][j] := (i - 1) * mat[i - 1][j - 1]
            }
            j := j + 1
        }
        i := i + 1
    }
    
    return mat[n + 1][k + 1]
}

ToCombination(in_str) {
    ; position := RegExMatch(in_str, "O)C\((?<FIRST>-?\d+),\s*(?<SECND>-?\d+)\)", match)
    position := RegExMatch(in_str, "O)(?<FIRST>-?\d+)\D+(?<SECND>-?\d+)", match)
    first := match.Value("FIRST")
    secnd := match.Value("SECND")
    
    if (!first or !secnd) {
        return ""
    }
    
    return Combination(first, secnd)
}

ToArrangement(in_str) {
    ; position := RegExMatch(in_str, "O)P\((?<FIRST>-?\d+),\s*(?<SECND>-?\d+)\)", match)
    position := RegExMatch(in_str, "O)(?<FIRST>-?\d+)\D+(?<SECND>-?\d+)", match)
    first := match.Value("FIRST")
    secnd := match.Value("SECND")
    
    if (!first or !secnd) {
        return ""
    }
    
    return Arrangement(first, secnd)
}


;;;;;;;;;;;;;;;;;;;;;;
; --- Hotstrings --- ;
;;;;;;;;;;;;;;;;;;;;;;


; Procedural
;;;;;;;;;;;;

; Hotstring: Replace the pattern -?\d+..-?\d+ in the clipboard with list of numbers
:*:;numbers;::
    Monitor.Clip("ToList", Clipboard)
    return
    
; Hotstring: Replace the hotstring with a combination (binomial coefficient) using
; the first two separated numbers on the clipboard
:*:;choose;::
    Monitor.Run("ToCombination", Clipboard)
    return
    
; Hotstring: Replace the hotstring with an arragement using the first two separated
; numbers on the clipboard
:*:;arrange;::
    Monitor.Run("ToArrangement", Clipboard)
    return
    
    
; General
;;;;;;;;;

; Hotstring: (–) En dash
:*:;--;::
    Monitor.SendUnicode("{U+2013}") ; –
    return
    
; Hotstring: (—) Em dash
:*:;---;::
    Monitor.SendUnicode("{U+2014}") ; —
    return
    
    
; Mathematical
;;;;;;;;;;;;;;

; Hotstring: (→) Arrow
:*:;-.;::
    Monitor.SendUnicode("{U+2192}") ; →
    return
    
; Hotstring: (←) Back arrow
:*:;,-;::
    Monitor.SendUnicode("{U+2190}") ; ←
    return
    
; Hotstring: (✕) Multiplication sign
:*:;x;::
    Monitor.SendUnicode("{U+2715}") ; ✕
    return
    
; Hotstring: (−) Minus sign
:*:;-;::
    Monitor.SendUnicode("{U+2212}") ; −
    return
    
; Hotstring: (¬) Negation
:*:;not;::
    Monitor.SendUnicode("{U+00AC}") ; ¬
    return
    
; Hotstring: (≠) Not equal
:*:;ne;::
    Monitor.SendUnicode("{U+2260}") ; ≠
    return
    
; Hotstring: (≤) Less than or equal
:*:;le;::
    Monitor.SendUnicode("{U+2264}") ; ≤
    return
    
; Hotstring: (≥) Greater than or equal
:*:;ge;::
    Monitor.SendUnicode("{U+2265}") ; ≥
    return
    
; Hotstring: (⇔) Material equivalence
:*:;means;::
    Monitor.SendUnicode("{U+21D4}") ; ⇔
    return
    
; Hotstring: (∧) Logical conjunction (Wedge, Ac, Atque)
:*:;and;::
    Monitor.SendUnicode("{U+2227}") ; ∧
    return
    
; Hotstring: (∨) Logical disjunction (Vel)
:*:;or;::
    Monitor.SendUnicode("{U+2228}") ; ∨
    return
    
; Hotstring: (∀) Universal quantifier
:*:;all;::
    Monitor.SendUnicode("{U+2200}") ; ∀
    return
    
; Hotstring: (∇) Nabla (Del)
:*:;del;::
    Monitor.SendUnicode("{U+007F}") ; ∇
    return
    
; Hotstring: (∞) Infinity
:*:;inf;::
    Monitor.SendUnicode("{U+221E}") ; ∞
    return
    
    
; Mathematical Extended
;;;;;;;;;;;;;;;;;;;;;;;

; Hotstring: (∈) Is an element of
:*:;in;::
    Monitor.SendUnicode("{U+2208}") ; ∈
    return
    
; Hotstring: (∉) Is not an element of
:*:;nin;::
    Monitor.SendUnicode("{U+2209}") ; ∉
    return
    
; Hotstring: (∃) Existential quantifier
:*:;some;::
    Monitor.SendUnicode("{U+2203}") ; ∃
    return
    
    
; Greek Alphabet
;;;;;;;;;;;;;;;;

; Hotstring: (Δ) Upper delta
:c*:;Delt;::
    Monitor.SendUnicode("{U+0394}") ; Δ
    return
    
; Hotstring: (δ) Lower delta
:c*:;delt;::
    Monitor.SendUnicode("{U+03B4}") ; δ
    return
    
; Hotstring: (Ο) Upper omicron
:c*:;Omic;::
    Monitor.SendUnicode("{U+039F}") ; Ο
    return
    
; Hotstring: (ο) Lower omicron
:c*:;omic;::
    Monitor.SendUnicode("{U+03BF}") ; ο
    return
    
; Hotstring: (Ω) Upper omega
:c*:;Omeg;::
    Monitor.SendUnicode("{U+03A9}") ; Ω
    return
    
; Hotstring: (ω) Lower omega
:c*:;omeg;::
    Monitor.SendUnicode("{U+03C9}") ; ω
    return
    
; Hotstring: (Θ) Upper theta
:c*:;Thet;::
    Monitor.SendUnicode("{U+0398}") ; Θ
    return
    
; Hotstring: (θ) Lower theta
:c*:;thet;::
    Monitor.SendUnicode("{U+03B8}") ; θ
    return
    
; Hotstring: (ϑ) Cursive theta
:c*:;cthet;::
    Monitor.SendUnicode("{U+03D1}") ; ϑ
    return
    