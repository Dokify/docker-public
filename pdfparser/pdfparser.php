<?php

use Smalot\PdfParser\Parser as PdfParser;

require_once __DIR__ . "/vendor/autoload.php";

$pdfParser = new PdfParser();

try {
    $file = $_SERVER['argv'][1];
    $pdf = $pdfParser->parseFile($file);
    $texts = $pdf->getText();
} catch (\Exception $e) {
    $texts = null;
}

echo $texts;

