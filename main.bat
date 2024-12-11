@echo off
:: Set the target directory for organizing files
set "TARGET_DIR=%USERPROFILE%\Documents\Organized_Files"

:: Create folders for each file type (PDFs, Word Documents, Images, Duplicates)
mkdir "%TARGET_DIR%\PDFs"
mkdir "%TARGET_DIR%\Word_Documents"
mkdir "%TARGET_DIR%\Images"
mkdir "%TARGET_DIR%\Duplicates"

:: Step 1: Organize Files
:: Scan and move PDF files to the PDFs folder
for %%f in (*.pdf) do move "%%f" "%TARGET_DIR%\PDFs\"

:: Scan and move Word files (docx, doc) to the Word Documents folder
for %%f in (*.docx *.doc) do move "%%f" "%TARGET_DIR%\Word_Documents\"

:: Scan and move image files (jpg, jpeg, png) to the Images folder
for %%f in (*.jpg *.jpeg *.png) do move "%%f" "%TARGET_DIR%\Images\"

echo Files organized into folders: PDFs, Word Documents, Images.

:: Step 2: Rename Files
:: Rename files in the PDFs folder with a consistent naming convention
for %%f in ("%TARGET_DIR%\PDFs\*") do ren "%%f" "PDF_%%~nf_%%~tf%%~xf"

:: Rename files in the Word Documents folder
for %%f in ("%TARGET_DIR%\Word_Documents\*") do ren "%%f" "Word_%%~nf_%%~tf%%~xf"

:: Rename files in the Images folder
for %%f in ("%TARGET_DIR%\Images\*") do ren "%%f" "Image_%%~nf_%%~tf%%~xf"

echo Files renamed with a consistent naming convention.

:: Step 3: Detect Duplicates
:: Check for duplicate files by comparing content
for %%f in ("%TARGET_DIR%\*") do (
    for %%g in ("%TARGET_DIR%\*") do (
        if "%%f" neq "%%g" (
            fc /b "%%f" "%%g" > nul
            if not errorlevel 1 (
                echo Duplicate found: %%g
                :: Ask for user confirmation before deleting or moving duplicates
                set /p DELETE_CONFIRM=Do you want to delete %%g? (y/n): 
                if /i "%DELETE_CONFIRM%"=="y" del "%%g"
                if /i "%DELETE_CONFIRM%"=="n" move "%%g" "%TARGET_DIR%\Duplicates\"
            )
        )
    )
)

:: Step 4: Generate Report
:: Create a log file summarizing the actions performed
echo Generating report...
echo Files organized, renamed, and duplicates handled. > "%TARGET_DIR%\report.txt"

:: Log organized PDFs
echo Organized PDFs: >> "%TARGET_DIR%\report.txt"
dir /b "%TARGET_DIR%\PDFs" >> "%TARGET_DIR%\report.txt"

:: Log organized Word Documents
echo Organized Word Documents: >> "%TARGET_DIR%\report.txt"
dir /b "%TARGET_DIR%\Word_Documents" >> "%TARGET_DIR%\report.txt"

:: Log organized Images
echo Organized Images: >> "%TARGET_DIR%\report.txt"
dir /b "%TARGET_DIR%\Images" >> "%TARGET_DIR%\report.txt"

:: Log duplicates moved
echo Duplicates moved: >> "%TARGET_DIR%\report.txt"
dir /b "%TARGET_DIR%\Duplicates" >> "%TARGET_DIR%\report.txt"

echo Report saved to %TARGET_DIR%\report.txt

:: Pause the script to allow the user to review messages
pause
