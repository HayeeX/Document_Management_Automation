# Document Management Automation

## Overview
**Document Management Automation** is a batch script-based tool designed to simplify document organization and management. It automates tasks such as organizing files into folders, renaming files with consistent conventions, detecting duplicate files, and generating a detailed action report. This script ensures a user-friendly experience by asking for confirmation before any file deletions.

## Features
1. **Organize Files**: Automatically organizes PDFs, Word documents, and images into categorized folders.
2. **Rename Files**: Renames files with a consistent and metadata-based naming convention.
3. **Detect Duplicates**: Identifies duplicate files by comparing content and moves them to a dedicated folder.
4. **Reporting**: Generates a detailed report summarizing all actions performed.
5. **User Interaction**: Prompts users for permission before deleting duplicate files.

## Installation
1. Clone or download this repository.
2. Place the `document_management.bat` file in the directory where you want to manage files.

## Usage
1. Double-click the `document_management.bat` file to run the script.
2. Follow the on-screen prompts for user confirmation during the duplicate handling process.
3. After completion, find organized files in the `Documents\Organized_Files` directory and a detailed report (`report.txt`) summarizing the actions.

## File Structure
- **PDFs**: Contains all organized PDF files.
- **Word_Documents**: Contains all organized Word files (e.g., `.docx`, `.doc`).
- **Images**: Contains all organized image files (e.g., `.jpg`, `.png`, `.jpeg`).
- **Duplicates**: Contains identified duplicate files for review.
- **report.txt**: A log file detailing the actions performed by the script.

## Customization
- **Target Directory**: Modify the `TARGET_DIR` variable in the script to change the output folder.
- **File Extensions**: Update the `for %%f` loops to include additional file types if needed.

## License
This project is licensed under the **Haye Technologies License**.

## Contact
For questions, suggestions, or support, please contact Haye Technologies at haye.officiall@gmail.com.

