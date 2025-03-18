# AWS Hands-on 실습 스터디
> AWS 인프라 실습 & 클라우드 엔지니어링 역량 강화를 위한 실전 스터디  

## 스터디 개요
AWS의 핵심 서비스를 실습하고, 실무에서 활용되는 **클라우드 아키텍처 설계, 운영, 배포 자동화, 서버리스 컴퓨팅** 등을 경험하는 실습 중심의 스터디입니다.  

## 스터디 목표
- **AWS의 핵심 서비스** (EC2, S3, RDS, Lambda, Auto Scaling 등) 실습  
- **클라우드 인프라 구축 & 운영 경험** (서버리스, CI/CD, 모니터링 포함)  
- **실전 프로젝트 경험** (AWS 기반 애플리케이션 배포 및 최적화)  

## 스터디 진행 일정
| 주차  | 실습 주제 |
|------|--------------------------------------------|
| **1주차** | Amazon EC2 & 기본 인프라 이해 |
| **2주차** | AWS S3 & Auto Scaling 활용한 갤러리 웹사이트 구축 / React static site 배포 |
| **3주차** | Amazon RDS & Load Balancing을 활용한 고가용성 웹 애플리케이션 구축 |
| **4주차** | AWS Lambda & ElastiCache (Redis)를 활용한 성능 최적화 & API 속도 개선 |
| **5주차** | Serverless Discord Chatbot 구축 |
| **6주차** | Terraform을 활용한 Amazon EKS(Kubernetes) 클러스터 배포 및 CI/CD 적용 |
| **7주차** | Amazon CloudWatch & Auto Scaling 고급 실습 |
| **8~10주차** | AWS 기반 팀 프로젝트 진행 |

## 실습 가이드
1. 매주 제공되는 실습 내용을 따라가며 **Hands-on 실습 진행**  
2. 해당 주차의 발제자는 해당 실습 내용을 `.md` 파일로 정리하여 해당 주차 폴더에 업로드  
3. 팀원들과 **이슈 & PR 활용하여 피드백 공유**  
4. 최종적으로 팀 프로젝트를 통해 **실무형 AWS 환경을 구축**

## 발제 순서
1-7주차 **기본실습** 발제 : 김도윤
**심화실습** 발제
2주차 : 김민경
3주차 : 김주연
4주차 : 최승우
5주차 : 강소연
6주차 : 임태빈
7주차 : 송여경
8주차 : 김도윤


## 레포지토리 구조
```bash
aws-study/
 ├── week-1-ec2-infra/          # 1주차: EC2 & 기본 인프라
 ├── week-2-s3-auto-scaling/    # 2주차: S3 & Auto Scaling 활용 갤러리 웹사이트 구축 / React static site 배포
 ├── week-3-rds-load-balancer/  # 3주차: Amazon RDS & Load Balancing을 활용한 고가용성 웹 애플리케이션 구축
 ├── week-4-lambda-redis/       # 4주차: AWS Lambda & ElastiCache(Redis) 활용한 성능 최적화
 ├── week-5-serverless-bot/     # 5주차: Serverless Discord Chatbot 구축 (Lambda + API Gateway + SNS)
 ├── week-6-terraform-eks/      # 6주차: Terraform을 활용한 Amazon EKS(Kubernetes) 배포 및 CI/CD 구축
 ├── week-7-cloudwatch-scaling/ # 7주차: CloudWatch & Auto Scaling 고급 실습
 ├── final-project/             # 8~10주차: AWS 기반 팀 프로젝트 진행
 ├── assets/                    # 추가 자료 (스크린샷, 다이어그램)
 └── README.md                   # 스터디 개요 & 진행 방식 정리

