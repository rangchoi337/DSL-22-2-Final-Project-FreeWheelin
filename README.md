# 2022-2학기 DSL X FreeWheelin 기업연계 프로젝트

학생 실력 향상 지표 수립 및 학생 유형 클러스터링

team C : 김지희 김남훈 박지호 손승진 정건우 안민용 김한빈<br>
team B : 김종민 김형민 엄소은 이승연 조찬형 최윤서<br>
team A : 전재현 김채은 이재우 장준혁 조수연 한예림

## Overview & Result

[Presentation PDF](https://github.com/DataScience-Lab-Yonsei/DSL-22-2-Final-Project-FreeWheelin/blob/main/final_pdf/22-2_DSL_FREEWHEELIN_.pdf)<br>
[Presentation Youtube](https://www.youtube.com/watch?v=FQhV5c-cpL8&t=2127s)

### teamC
![C결론](https://user-images.githubusercontent.com/107980286/210123462-17ee6d2e-bf0b-402c-96be-34566b8d7bc5.JPG)
### teamB
![B결론](https://user-images.githubusercontent.com/107980286/210123465-64996c0f-7887-49a3-a381-213b11721715.JPG)
### teamA
![A결론](https://user-images.githubusercontent.com/107980286/210123466-103ff60e-c1bd-4ae0-9762-586f4cf21228.JPG)
![A결론2](https://user-images.githubusercontent.com/72757567/210123670-08b9ea40-d1de-4743-bbeb-530981c54181.png)



## File Description
### teamC
- Analysis
  - `Is_worksheet_better_than_workbook_.ipynb` : Worksheet을 위주로 공부한 그룹과 Workbook을 위주로 공부한 그룹의 Score 비교
  - `Rate_of_improvement_by_student.ipynb` : 학생별 실력 향상 정도 분석
- Dashboard
  - `student_academy_score_analysis.twb` : 전처리한 pivot table로 기간별, 학원별 분석
- Preprocess
  - `Preprocess_FinalPivotTable.ipynb` : 연도별, 분기별, 과목별 누적 score와 학원 등급에 대한 pivot table 생성
  - `Preprocess_MergeSQLData.ipynb` : Database에서 현재 운영중인 학원을 대상으로 고3 학생과 관련된 모든 테이블 병합후 scoring 진행
### teamB
- Clustering
  - `deriv_clustering_pca.ipynb` : 미적분 과목 Clustering을 통해 학생 분석
  - `su1_clustering_pca.ipynb` : 수학I 과목 Clustering을 통해 학생 분석
  - `su2_clustering_pca.ipynb` : 수학II 과목 Clustering을 통해 학생 분석
- NN model
  - `embedding vector extract using CNN model.ipynb`: CNN model을 사용한 과목별 embedding vector 추출
- Data 
  - 회사 정책 상 공개 불가능
- preprocessing
  - `Refining.ipynb` : 데이터 가공 (학생별/문제유형+난이도 별 정답률 추출 및 과목별 )

### teamA
- Embedding_NN
  - `embedding_model.ipynb` : 학생, 문제 feature를 바탕으로 문제를 해당 학생이 맞출 확률값을 도출하는 embedding 모델 구현
  - `embedding_dataset.sql` : Database에서 Worksheet problem 기준으로 고3 학생 데이터만 추린 테이블 생성하는 sql. 자세한 column은 발표 pdf p.134 참고
- Time_Series_Clustering
  - `merge_data.ipynb` : 프리윌린이 제공한 데이터 중 필요한 table만 선택적으로 병합한 data frame을 csv파일로 저장
  - `data_preprocess_final.ipynb` : 병합한 데이터셋을 단원별, 학생별, 문제 난이도별로 구분하여 총 6개의 csv 파일로 저장
  - `time_series_clustering_model_final.ipynb` : TimeSeriesScalerMeanVariance를 통한 전처리, 전처리한 데이터에 TimeSeriesKMeans를 수행하고 결과 분석 및 결과 저장
