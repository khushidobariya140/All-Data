#!/bin/bash
set -e

# Target category directories
CATEGORIES=(
  "Python-Projects"
  "SQL-Projects"
  "Excel-Projects"
  "PowerBI-Projects"
  "Statistics-Projects"
  "Business-Case-Studies"
  "Data-Preprocessing-Projects"
  "Machine-Learning-Projects"
)

echo "Creating target repository directories..."
for cat in "${CATEGORIES[@]}"; do
  mkdir -p "$cat"
done

echo "Migrating projects to target categories..."

# 1. Python-Projects
echo "Migrating Python-Projects..."
cp -r "Analyzer" "Python-Projects/"
cp -r "Data Profiler" "Python-Projects/"
cp -r "Final Project" "Python-Projects/"
cp -r "Final_ Project" "Python-Projects/"
cp -r "TechWar" "Python-Projects/"

# 2. SQL-Projects
echo "Migrating SQL-Projects..."
mkdir -p "SQL-Projects/DATA TRANSFORMER"
cp "DATA TRANSFORMER.sql" "SQL-Projects/DATA TRANSFORMER/"

mkdir -p "SQL-Projects/E-COMMERCE"
cp "E-COMMERCE.sql" "SQL-Projects/E-COMMERCE/"

mkdir -p "SQL-Projects/FINAL PROJECT"
cp "FINAL PROJECT.sql" "SQL-Projects/FINAL PROJECT/"

mkdir -p "SQL-Projects/PROJECT1"
cp "PROJECT1.sql" "SQL-Projects/PROJECT1/"

# 3. Excel-Projects
echo "Migrating Excel-Projects..."
mkdir -p "Excel-Projects/PR. 2 Analyzer"
cp "PR. 2 Analyzer (1).xlsx" "Excel-Projects/PR. 2 Analyzer/"

mkdir -p "Excel-Projects/PR. Final Project"
cp "PR. Final Project.xlsx" "Excel-Projects/PR. Final Project/"

mkdir -p "Excel-Projects/PROJECT1"
cp "PROJECT1.xlsx" "Excel-Projects/PROJECT1/"

mkdir -p "Excel-Projects/Khushi Dashboard"
cp "khushi_dashboard.xlsx" "Excel-Projects/Khushi Dashboard/"

# 4. PowerBI-Projects
echo "Migrating PowerBI-Projects..."
cp -r "DATA LAVERAGER" "PowerBI-Projects/"
cp -r "DATA MODELER" "PowerBI-Projects/"
cp -r "DAX" "PowerBI-Projects/"
cp -r "DAX DEPO" "PowerBI-Projects/"
cp -r "FINAL PROJECT POWERBI" "PowerBI-Projects/"
cp -r "PRACTICAL EXAM" "PowerBI-Projects/"
cp -r "STUDENT PERFORMANCE DASHBOARD" "PowerBI-Projects/"

mkdir -p "PowerBI-Projects/Healthcare Dashboard"
cp "HealthCare.pbix" "PowerBI-Projects/Healthcare Dashboard/"

mkdir -p "PowerBI-Projects/K Dashboard"
cp "K.pbix" "PowerBI-Projects/K Dashboard/"

mkdir -p "PowerBI-Projects/ViMAX Sales Analysis"
cp "ViMAX Sales Analysis.pbix" "PowerBI-Projects/ViMAX Sales Analysis/"

mkdir -p "PowerBI-Projects/PowerBI Design Assets"
cp "Powebi Bg.pptx" "PowerBI-Projects/PowerBI Design Assets/"
if [ -f "product-color-icons.svg" ]; then
  cp "product-color-icons.svg" "PowerBI-Projects/PowerBI Design Assets/"
fi

# 5. Statistics-Projects
echo "Migrating Statistics-Projects..."
cp -r "Calculative Foundation" "Statistics-Projects/"
cp -r "DERIVABLE JUDGEMENT" "Statistics-Projects/"
cp -r "Descriptive Booster" "Statistics-Projects/"
cp -r "Expectation Decider" "Statistics-Projects/"
cp -r "Mathematics_Final_Practical" "Statistics-Projects/"
cp -r "Spread Locator" "Statistics-Projects/"

# 6. Business-Case-Studies
echo "Migrating Business-Case-Studies..."
cp -r "Business Case Study" "Business-Case-Studies/"

# 7. Data-Preprocessing-Projects
echo "Migrating Data-Preprocessing-Projects..."
cp -r "Customer Purchase Behavior Analyzer" "Data-Preprocessing-Projects/"
cp -r "Data Cleanser" "Data-Preprocessing-Projects/"
cp -r "Final Project Data Preprocessing & Feature Engineering" "Data-Preprocessing-Projects/"

# 8. Machine-Learning-Projects
echo "Migrating Machine-Learning-Projects..."
cp -r "Houseprice_Prediction" "Machine-Learning-Projects/"

# Initialize Git repositories in each category directory for clean independent repository creation
echo "Initializing local git repositories for target categories..."
for cat in "${CATEGORIES[@]}"; do
  if [ -d "$cat" ]; then
    (
      cd "$cat"
      if [ ! -d ".git" ]; then
        git init -b main
      fi
    )
  fi
done

echo "Migration script preparation complete."
