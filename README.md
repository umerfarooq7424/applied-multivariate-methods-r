# Applied Multivariate Methods in R

> Graduate coursework in applied multivariate statistics (Rutgers, 833:525 / 970:527): eight assignments, each pairing an R script with its written analysis, over health, clinical, and social-science datasets.

## Methods covered

Logistic regression · GLMs · mixed-effects models (`lme4`) · multinomial models (`nnet`) · generalized estimating equations (`geepack`) · penalized regression (`glmnet`) · model diagnostics (`car`, `lmtest`) · categorical-data techniques (`questionr`)

## Assignments

| HW | Analysis | Data |
|---|---|---|
| 03 | Esophageal cancer case–control study: alcohol, tobacco, age effects | `esoph_cancer.csv` (977 records) |
| 04 | Estimated blood loss in surgery: regression with race/age categorization | `eblcat.csv` (142 patients) |
| 05 | Blood-loss threshold model: dichotomized outcome, logistic specification tests | `eblcat.csv` |
| 06 | UMARU drug-treatment trial: mixed-effects modelling of treatment outcomes | `UMARU.csv` (574 clients) |
| 07 | Pregnancy mortality by year, cause, and race/ethnicity: GLM approaches | `pregmortality.csv` (241 rows) |
| 08 | Multinomial outcome modelling | course data |
| 09 | Longitudinal/correlated data: GEE models | course data |
| 10 | Written analysis (report only) | — |

Also in `data/`: `stress-1.csv` (926 rows) and `workdata.csv` (316 rows), used across assignments.

## Layout

- `scripts/` — the R code for HW03–HW09 (data paths normalized to `data/`; run from the repo root)
- `reports/` — the submitted analyses, HW03–HW10 (PDF)
- `data/` — the datasets, all standard teaching/research datasets used in the course

## Author

**Umer Farooq** — Economic & Climate Risk Analyst · [LinkedIn](https://www.linkedin.com/in/umer-farooq-gojra/) · [GitHub](https://github.com/umerfarooq7424)

## License

MIT for the code and reports — see LICENSE. Datasets are the standard course/teaching versions of published study data.
