* ___Encryption, Resource 및 일부 파일들은 비공개합니다.___  

<h1 align="center">DepRx & Sham</h1>
<div align="left">

![Stack](https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=Flutter&logoColor=white)
![Stack](https://img.shields.io/badge/android-3DDC84?style=for-the-badge&logo=Android&logoColor=white)
![Stack](https://img.shields.io/badge/apple-000000?style=for-the-badge&logo=IOS&logoColor=white)
![Stack](https://img.shields.io/badge/dart-0175C2?style=for-the-badge&logo=Dart&logoColor=white)
![Stack](https://img.shields.io/badge/kotlin-7F52FF?style=for-the-badge&logo=Kotlin&logoColor=white)
![Stack](https://img.shields.io/badge/swift-F05138?style=for-the-badge&logo=Swift&logoColor=white)
![Stack](https://img.shields.io/badge/firebase-FFCA28?style=for-the-badge&logo=Firebase&logoColor=white)
</div>

<div>
 <table>
    <tr>
       <td>
         <img width="600px" src="./screen_shot/Frame%201.png">
      </td>
    </tr>
    <tr>
       <td>
         <img width="600px" src="./screen_shot/deprx.webp">
      </td>
    </tr>
 </table>
</div>

### 📌 프로젝트 개요  
DepRx는 BA 기반으로 우울증 치료한 디지털 치료제입니다. BA 추천, 선택 및 수행, K-BDS, Reward, Report등의 기능을 제공합니다.  

### 💡 프로젝트 인원 구성  
- App개발자(1명), 서버 개발(1명), 디자이너(1명), 기획자(1명)  

### ⚙️ 기술 Stack
* 상태 관리 및 바인딩, 라우팅 -> GetX
* 디자인 패턴 -> Clean Architecture
* 의존성 주입 -> DI
* Package 관리 -> Melos

### 🧑‍💻 프로젝트내 담당 업무  
<details>
    <summary>서비스 설계</summary>
 <pre>
 1. TF-Team 리드
  ㆍ Desc : 기획자의 부재로 TF-Team을 꾸려 서비스 설계 -> 주요 기능들 기획, 서비스 플로우 및 Architecture 설계  
 2. 운영 관련 
  ㆍ Desc : GA, 언어팩, Sentry, SDUI, Firebase Remote Config, Hot fix등 설계 및 개발  
 3. 임상용 배포 설계 및 개발
  ㆍ Desc : CI/CD 설계 및 개발, RemoteConfig 기반 A/B테스트 설계 및 개발
</details>  
<details>
    <summary> Melos 설계 및 개발 </summary>
 <pre>
  ㆍ Desc : DepRx와 Sham 2가지 앱에서 공통으로 사용되는 패키지들을 개발 및 관리하기 위해 Melos 설계 및 개발
  ㆍ Detail :
     1. 기능 별로 패키지 분리 설계
     2. Resource(Local data 및 Asset들을 관리 및 활용하는 패키지) 패키지 개발
     3. Encryption(암호화 및 앱 환경 변수 관리 패키지) 개발
     4. Core(Util, Handler, Extension, Regex등 관리 패키지) 개발
     5. Common(Component 패키지) 개발
     6. API(Data Layer 및 Domain Layer 관리 패키지) 개발
     7. DepRx 앱 패키지 개발
     8. Sham 앱 패키지 개발
 </pre>
</details>
<details>
    <summary> 성능 개선</summary>
    <pre>
     1. 성능 점겅
     ㆍ Desc : Flutter DevTool 및 Device Util을 활용해 앱 성능을 1차 검토하고, 기업 도움 관련 센터에서 다양한 Physical Device를 빌려 2차 성능 검토
     2. Singletone같은 Isolate 기능 개발
     ㆍ Desc : Isolate를 활용해 서비스에서 사용되는 로컬 데이터를 Isolate에 넣어놓고, 필요할때 마다 사용할 수 있는 기능 개발
     3. Local Image Preload 기능 개발
     ㆍ Desc : 앱 실행시 Local에 있는 이미지를 Cache에 올려 이미지 로딩 속도를 개선하는 기능 개발
     4. Local DB 기능 개선
     ㆍ Desc : SharedPreference에서 ObjectBox로 대체하여 개발
     5. Timer 기능 개선
     ㆍ Desc : Controller에서 Rx로 사용하던 Timer를 Isolate를 활용하는 Class로 대체하는 기능 개발 
     6. 리팩토링
     ㆍ Desc : 패키지들 및 앱 관련 리팩토링
    </pre>
</details>
<details>
    <summary> 임상 관련 문서 작성 </summary>
    <pre>
     1. 임상 보안 문서 일부 작성
     2. 앱 프로토콜 문서 작성
    </pre>
</details>

### 협업 Tool
![Stack](https://img.shields.io/badge/slack-4A154B?style=for-the-badge&logo=Slack&logoColor=white)
![Stack](https://img.shields.io/badge/figma-F24E1E?style=for-the-badge&logo=Figma&logoColor=white)
![Stack](https://img.shields.io/badge/notion-000000?style=for-the-badge&logo=Notion&logoColor=white)
![Stack](https://img.shields.io/badge/github-181717?style=for-the-badge&logo=Github&logoColor=white)
