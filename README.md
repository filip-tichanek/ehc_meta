
**Authors and affiliations**

<div style="font-size: larger;">
Roman Pavlov<sup>1,2</sup>, Adam Whitley<sup>2,3</sup>, David Kachlík<sup>2,4</sup>, Filip Tichanek<sup>5</sup>, Daniel Palouš<sup>1</sup>, and Theodor Adla<sup>1</sup>
</div>

<br>

<sup>1</sup> Department of Radiodiagnostic and Interventional Radiology, Institute for Clinical and Experimental Medicine, Vídeňská 1958, Praha 4 140 21, Czech Republic.  
<sup>2</sup> Center for Endoscopic, Surgical and Clinical Anatomy (CESKA), Second Faculty of Medicine, Charles University, V Úvalu 84, Praha 5 150 06, Czech Republic.  
<sup>3</sup> Cardiocenter, Third Faculty of Medicine, Charles University and University Hospital Královské Vinohrady, Ruská 2411/87, 100 00 Prague 10, Czech Republic.  
<sup>4</sup> Department of Anatomy, Second Faculty of Medicine, Charles University, V Úvalu 84, Praha 5 150 06, Czech Republic.  
<sup>5</sup> Department of Data Science, Institute of Clinical and Experimental Medicine, Vídeňská 1958, Praha 4 140 21, Czech Republic.

---

This repository contains the statistical report and analysis code for the manuscript titled ***Extrahepatic blood supply to hepatocellular carcinoma: a meta-analysis and systematic review***.

When using this code or statistical report, please cite the original manuscript (update once published):

> Pavlov R., Whitley A., Kachlík D., Tichanek F., Palouš D., Adla T. Extrahepatic blood supply to hepatocellular carcinoma: a meta-analysis and systematic review. *[Journal Name]* (Year). [DOI]

---

Original [GitHub repository](https://github.com/filip-tichanek/ehc_meta): https://github.com/filip-tichanek/ehc_meta

Statistical **report** can be found [here](https://filip-tichanek.github.io/ehc_meta/).

---

**General analytical workflow**

The meta-analysis follows this workflow:

1. **Data preparation:** Study-level data were extracted from the included publications, including the number of patients, patients with EHC, total EHC counts, and counts of individual arterial sources. Specific arterial sources were harmonized into predefined groups.

2. **EHC prevalence:** The prevalence of EHC was estimated using a Bayesian hierarchical binomial model with a logit link and study-specific random intercepts.

3. **EHC count per patient:** The mean number of EHC vessels per enrolled patient was estimated using a Bayesian hierarchical Poisson model with a log link and an offset for the number of patients. A negative-binomial model was evaluated as a sensitivity analysis.

4. **Arterial source distribution:** The relative proportions of EHC arterial sources were estimated using Bayesian hierarchical multinomial models, accounting for the compositional nature of the data. Analyses considered both major arterial groups and individual arterial sources.

5. **Between-study heterogeneity:** Heterogeneity was quantified using the posterior distributions of study-level random-effect standard deviations and summarized primarily by 95% posterior predictive intervals for the true underlying outcomes in new studies. Additional heterogeneity measures included the latent-scale intraclass correlation coefficient and Poisson variance partition coefficient.

6. **Model diagnostics:** Model fit was assessed using posterior predictive checks. Sampling diagnostics were examined to evaluate model convergence.

7. **Reporting and visualization:** Results were summarized using model-based estimates and 95% credible intervals. Forest plots and tables were generated to present EHC prevalence, counts, and the distribution of arterial sources.

