<?php
// Load the PHPStan XML report
$xmlFilePath = 'phpstan_checkstyle_report.xml'; // Adjust the path as needed
$xml = simplexml_load_file($xmlFilePath);

// Check if the XML was loaded successfully
if ($xml === false) {
    die('Failed to load the XML file.');
}

// Create an array to store FindBugs-style issues
$findbugsIssues = [];

// Iterate through PHPStan issues and transform them to FindBugs format
foreach ($xml->file as $file) {
    $fileName = (string)$file['name'];
    
    foreach ($file->error as $error) {
        $issue = [
            'type' => 'phpstan',
            'category' => 'PHPStan',
            'priority' => '3', // You can adjust the priority as needed
            'filename' => $fileName,
            'line' => (string)$error['line'],
            'message' => (string)$error,
            'description' => 'PHPStan Issue',
        ];
        $findbugsIssues[] = $issue;
    }
}

// Output FindBugs-style issues in XML format
echo '<?xml version="1.0" encoding="UTF-8"?>
<bugcollection>';

foreach ($findbugsIssues as $issue) {
    echo '<bug ';
    foreach ($issue as $key => $value) {
        echo "$key=\"$value\" ";
    }
    echo '/>';
}

echo '</bugcollection>';
?>
