# PowerShell script to compile ebook.tex to PDF
# Usage: open PowerShell, cd to this folder and run: .\build.ps1

if (-not (Get-Command pdflatex -ErrorAction SilentlyContinue)) {
    Write-Error "pdflatex not found. Please install MiKTeX or TeX Live and ensure pdflatex is in PATH."
    exit 1
}

Write-Host "Compiling ebook.tex..."
pdflatex ebook.tex
pdflatex ebook.tex

if (Test-Path ebook.pdf) {
    Write-Host "Compilation finished: ebook.pdf"
} else {
    Write-Error "Compilation failed. Check the .log file for details."
}
