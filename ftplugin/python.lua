vim.b.slime_cell_delimiter = "#\\s\\=%%"

-- pretty unicode characters for python
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.py" },
    desc = "Unicode characters for Python",
    group = vim.api.nvim_create_augroup("python-pretty-conceal", { clear = true }),
    callback = function()
        vim.cmd([[
    set conceallevel=2
    set concealcursor=niv
    set nofoldenable
    set foldmethod=indent

    syntax match Normal /\<def\>/ conceal cchar=ƒ
    syntax match Normal /\<return\>/ conceal cchar=⟶
    "syntax match Normal /\<return\>/ conceal cchar=↵
    syntax match Normal /\<class\>/ conceal cchar=𝓒
    "syntax match Normal /\<class\>/ conceal cchar=⊚
    syntax match Normal /\<self\>/ conceal cchar=∘
    syntax match Normal /\<for\>/ conceal cchar=∀
    syntax match Normal /continue/ conceal cchar=↻
    syntax match Normal /\<in\>/ conceal cchar=∈
    syntax match Normal /\<not in\>/ conceal cchar=∉
    syntax match Normal /\<import\>/ conceal cchar=∃
    syntax match Normal /\<None\>/ conceal cchar=∅
    syntax match Normal /\<break\>/ conceal cchar=■

    syntax keyword Normal alpha ALPHA conceal cchar=α
    syntax keyword Normal beta BETA conceal cchar=β
    syntax keyword Normal Gamma conceal cchar=Γ
    syntax keyword Normal gamma GAMMA conceal cchar=γ
    syntax keyword Normal Delta conceal cchar=Δ
    syntax keyword Normal delta DELTA conceal cchar=δ
    syntax keyword Normal epsilon EPSILON conceal cchar=ε
    syntax keyword Normal zeta ZETA conceal cchar=ζ
    syntax keyword Normal eta ETA conceal cchar=η
    syntax keyword Normal Theta conceal cchar=ϴ
    syntax keyword Normal theta THETA conceal cchar=θ
    syntax keyword Normal kappa KAPPA conceal cchar=κ
    syntax keyword Normal lambda LAMBDA lambda_ _lambda conceal cchar=λ
    syntax keyword Normal mu MU conceal cchar=μ
    syntax keyword Normal nu NU conceal cchar=ν
    syntax keyword Normal Xi conceal cchar=Ξ
    syntax keyword Normal xi XI conceal cchar=ξ
    syntax keyword Normal Pi conceal cchar=Π
    syntax keyword Normal rho RHO conceal cchar=ρ
    syntax keyword Normal sigma SIGMA conceal cchar=σ
    syntax keyword Normal tau TAU conceal cchar=τ
    syntax keyword Normal upsilon UPSILON conceal cchar=υ
    syntax keyword Normal Phi conceal cchar=Φ
    syntax keyword Normal phi PHI conceal cchar=φ
    syntax keyword Normal chi CHI conceal cchar=χ
    syntax keyword Normal Psi conceal cchar=Ψ
    syntax keyword Normal psi PSI conceal cchar=ψ
    syntax keyword Normal Omega conceal cchar=Ω
    syntax keyword Normal omega OMEGA conceal cchar=ω
    syntax keyword Normal nabla NABLA conceal cchar=∇

    " Greek letters
    syntax match Normal /\<alpha\>/ conceal cchar=α
    syntax match Normal /\<beta\>/ conceal cchar=β
    syntax match Normal /\<gamma\>/ conceal cchar=γ
    syntax match Normal /\<Gamma\>/ conceal cchar=Γ
    syntax match Normal /\<delta\>/ conceal cchar=δ
    syntax match Normal /\<Delta\>/ conceal cchar=Δ
    syntax match Normal /\<epsilon\>/ conceal cchar=ε
    syntax match Normal /\<zeta\>/ conceal cchar=ζ
    syntax match Normal /\<eta\>/ conceal cchar=η
    syntax match Normal /\<theta\>/ conceal cchar=θ
    syntax match Normal /\<iota\>/ conceal cchar=ι
    syntax match Normal /\<kappa\>/ conceal cchar=κ
    syntax match Normal /\<mu\>/ conceal cchar=μ
    syntax match Normal /\<nu\>/ conceal cchar=ν
    syntax match Normal /\<xi\>/ conceal cchar=ξ
    syntax match Normal /\<pi\>/ conceal cchar=π
    syntax match Normal /\<rho\>/ conceal cchar=ρ
    syntax match Normal /\<Sigma\>/ conceal cchar=Σ
    syntax match Normal /\<sigma\>/ conceal cchar=σ
    syntax match Normal /\<tau\>/ conceal cchar=τ
    syntax match Normal /\<phi\>/ conceal cchar=φ
    syntax match Normal /\<chi\>/ conceal cchar=χ
    syntax match Normal /\<psi\>/ conceal cchar=ψ
    syntax match Normal /\<omega\>/ conceal cchar=ω
    syntax match Normal /\<omega\>/ conceal cchar=Ω

    " no ending word boundary on parens
    "syntax match Normal '\v\.t\(\)' conceal cchar=ᵀ
    syntax match Normal '\v\.T>' conceal cchar=ᵀ

    " Matches x0 -> x₀ A2 -> A₂ word2 -> word₂
    " Use ms=s+1 to avoid concealing the letter before the number
    syntax match Normal '\v<[[:alpha:]_]+0>'ms=e conceal cchar=₀
    syntax match Normal '\v<[[:alpha:]_]+1>'ms=e conceal cchar=₁
    syntax match Normal '\v<[[:alpha:]_]+2>'ms=e conceal cchar=₂
    syntax match Normal '\v<[[:alpha:]_]+3>'ms=e conceal cchar=₃
    syntax match Normal '\v<[[:alpha:]_]+4>'ms=e conceal cchar=₄
    syntax match Normal '\v<[[:alpha:]_]+5>'ms=e conceal cchar=₅
    syntax match Normal '\v<[[:alpha:]_]+6>'ms=e conceal cchar=₆
    syntax match Normal '\v<[[:alpha:]_]+7>'ms=e conceal cchar=₇
    syntax match Normal '\v<[[:alpha:]_]+8>'ms=e conceal cchar=₈
    syntax match Normal '\v<[[:alpha:]_]+9>'ms=e conceal cchar=₉

    " Numbers
    syntax match Normal '\v[^_]\zs_0\ze>' conceal cchar=₀
    syntax match Normal '\v[^_]\zs_1\ze>' conceal cchar=₁
    syntax match Normal '\v[^_]\zs_2\ze>' conceal cchar=₂
    syntax match Normal '\v[^_]\zs_3\ze>' conceal cchar=₃
    syntax match Normal '\v[^_]\zs_4\ze>' conceal cchar=₄
    syntax match Normal '\v[^_]\zs_5\ze>' conceal cchar=₅
    syntax match Normal '\v[^_]\zs_6\ze>' conceal cchar=₆
    syntax match Normal '\v[^_]\zs_7\ze>' conceal cchar=₇
    syntax match Normal '\v[^_]\zs_8\ze>' conceal cchar=₈
    syntax match Normal '\v[^_]\zs_9\ze>' conceal cchar=₉
    " Letters
    syntax match Normal '\v[^_]\zs_[aA]\ze>' conceal cchar=ₐ
    syntax match Normal '\v[^_]\zs_[lL]\ze>' conceal cchar=ₗ
    syntax match Normal '\v[^_]\zs_[pP]\ze>' conceal cchar=ₚ
    syntax match Normal '\v[^_]\zs_[rR]\ze>' conceal cchar=ᵣ
    syntax match Normal '\v[^_]\zs_[sS]\ze>' conceal cchar=ₛ
    syntax match Normal '\v[^_]\zs_[uU]\ze>' conceal cchar=ᵤ
    syntax match Normal '\v[^_]\zs_[vV]\ze>' conceal cchar=ᵥ
    syntax match Normal '\v[^_]\zs_[xX]\ze>' conceal cchar=ₓ
    syntax match Normal '\v[^_]\zs_[hH]\ze>' conceal cchar=ₕ
    syntax match Normal '\v[^_]\zs_[iI]\ze>' conceal cchar=ᵢ
    syntax match Normal '\v[^_]\zs_[jJ]\ze>' conceal cchar=ⱼ
    syntax match Normal '\v[^_]\zs_[kK]\ze>' conceal cchar=ₖ
    syntax match Normal '\v[^_]\zs_[nN]\ze>' conceal cchar=ₙ
    syntax match Normal '\v[^_]\zs_[mM]\ze>' conceal cchar=ₘ
    syntax match Normal '\v[^_]\zs_[tT]\ze>' conceal cchar=ₜ

    " Need to use `syntax match` instead of `syntax keyword` or else keyword takes
    " priority and `range(len...` isn't matched

    syntax match Normal /\<range\>/ conceal cchar=ℝ
    syntax match Normal /\<arange\>/ conceal cchar=ℝ
    syntax match Normal /\<enumerate\>/ conceal cchar=↑

    ]])
    end,
})
