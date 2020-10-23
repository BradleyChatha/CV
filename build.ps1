# CONSTANTS
$OUTPUT_DIR  = "./build"
$GENERIC_PDF = "cv_generic.pdf";

# CONFIG
$OUTPUT_GENERIC_MODERN       = "cv_generic_modern.pdf"
$OUTPUT_GENERIC_TRADITIONAL  = "cv_generic_traditional.pdf"
$COMMAND_GENERIC_MODERN      = "pdflatex ""\def\bccvstyleoverride{Modern}\include{cv_generic}""";
$COMMAND_GENERIC_TRADITIONAL = "pdflatex ""\def\bccvstyleoverride{Traditional}\include{cv_generic}""";

New-Item -ItemType Directory -Force -Path $OUTPUT_DIR

function BuildPDF($Command, $OutputFile) {
    $OUTPUT = $OUTPUT_DIR+"/"+$OutputFile

    Invoke-Expression $Command
    Copy-Item -Path $GENERIC_PDF -Destination $OUTPUT
}

BuildPDF -Command $COMMAND_GENERIC_MODERN -OutputFile $OUTPUT_GENERIC_MODERN
BuildPDF -Command $COMMAND_GENERIC_TRADITIONAL -OutputFile $OUTPUT_GENERIC_TRADITIONAL