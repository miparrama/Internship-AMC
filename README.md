# Multiomics machine learning on the Dutch Famine Birth Cohort

__Masters Research Internship__  <br>
__Duration:__ March-August 2023 
<br>



__Author:__ Miguel Parra Martínez <br>
__Internship Supervisor:__ Dr. Peter Henneman <br>
__Daily Supervisor:__ Dr. Philip Jansen & Dr. Andrew Li Yim <br>
__Masters Program:__ MSc Bioinformatics and Systems Biology (Vrije Universiteit van Amsterdam & University of Amsterdam) <br>
__Host Institute:__ Amsterdam UMC <br>
__Focus:__ Machine learning with epigenetics and genetic data. <br>

__Abstract__ <br>
Prenatal famine exposure is correlated with a higher incidence of multiple metabolic, cardiovascular, and neurological conditions in adults. Observed persistent DNA methylation alterations have been proposed to be a key mediator in the development of such conditions. These associations have been fundamental to understand the effects of prenatal exposure to famine and its relevance to impaired development and disease in later life. Nevertheless, a possible contribution of the genetic background in these associations has not been explored yet. In this research, we used supervised machine-learning algorithms to asses if the combination of DNA methylation and genomic data can be used to classify individuals exposed or not to prenatal famine from the Dutch Famine Birth Cohort (DFBC). To avoid overfitting, we used a robust cross-validation scheme and a two-step feature selection based on a filter and a wrapper approach. Polygenic Risk Scores from 58 traits, of which many previously have been associated with prenatal famine exposure were used as a form of feature engineering of the genomic data. Classifier performance was close to random for predicting exposure to famine or not (best model $AUROC = 0.548\pm0.042$), although it improved when focussing only on individuals exposed in the first 6 months of pregnancy (best model $AUROC  = 0.629\pm0.108$). The performance improvement was mostly driven by DNA methylation data, and no clear interaction between genomic and epigenomic data was found. This backs the relevance of methylation remodeling in early pregnancy due to famine exposure. Nevertheless, more research is needed to address the biological implications of differences between exposed and non-exposed individuals. Overall, this research provides valuable insight into the possibilities and limitations of the use of machine learning with high-dimensional -omics data. <br>
The following workflow was followed in the project research: 

![workflow](/workflow.png?raw=true)
A) Schematic representation of the study dessing and the available data
B) Workflow of the project. 

