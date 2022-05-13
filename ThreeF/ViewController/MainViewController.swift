//
//  ViewController.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-06.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let alm = AutolayouutManager()
    
    let topBarView = UIView()
    let scrollView = UIScrollView()
    let bodyDataSectionView = UIView()
    let workoutRoutineBaseView = UIView()
    let workoutProgressView = UIView()
    let progressViewForWorkoutCount = WorkoutRatioView()
    let progressViewForRatioOfCardio = WorkoutRatioView()
    
    private var trainerVM: TrainerListViewModel!
    
    let CollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 100, height: 180)
        layout.scrollDirection = .horizontal
        let ccv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 200), collectionViewLayout: layout)
        ccv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ccvCell")
        return ccv;
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "MAIN"
        
        addTopBarSection()
        addScrollView()
        addWorkoutGoalGraphSection()
        addWorkoutScheduleSection()
        addBodyDataSection()
        addWorkoutProgressSection()

        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        setData()
    }
    
    func setData() {
        let info1 = Info(id: "trainer1", name: "Daniel", phone: "123-456-7890", password: "trainer1", email: "trainer1@gmail.com", deteJoined: Date())
        let trainer1 = Trainer(info: info1)
        
        let info2 = Info(id: "trainer2", name: "John", phone: "133-456-7890", password: "trainer2", email: "trainer2@gmail.com", deteJoined: Date())
        let trainer2 = Trainer(info: info2)
        
        let info3 = Info(id: "trainer3", name: "Sun", phone: "143-456-7890", password: "trainer3", email: "trainer3@gmail.com", deteJoined: Date())
        let trainer3 = Trainer(info: info3)
        
        let info4 = Info(id: "trainer4", name: "Kale", phone: "153-456-7890", password: "trainer4", email: "trainer4@gmail.com", deteJoined: Date())
        let trainer4 = Trainer(info: info4)
        trainerVM = TrainerListViewModel(trainers: [trainer1,trainer2,trainer3,trainer4])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        progressViewForWorkoutCount.setData("운동횟수 / 1 week", 4, 7)
        progressViewForRatioOfCardio.setData("유산소시간 / 총운동시간", 20, 100)
    }
    
    func addTopBarSection() {
        self.view.addSubview(topBarView)
        topBarView.frame = CGRect.zero
        alm.setAutolayoutWithHeight(view: self.view, object: topBarView, height: 150, left: 0, right: 0, top: getHeightForTop(), hCenter: true)
        topBarView.backgroundColor = .yellow
    }
    
    func addScrollView() {
        let tabBarHeight = self.tabBarController?.tabBar.frame.height
        self.view.addSubview(scrollView)
        alm.setAutolayoutWithHeight(view: self.view, object: scrollView, height: self.view.frame.size.height - getHeightForTop() - 300 - Double(tabBarHeight ?? 50) , left: 0, right: 0, top: getHeightForTop() + 150, hCenter: true)
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1500)
    }
    
    func getHeightForTop() -> Double {
        let window = UIApplication.shared.windows.first
        let top = window?.safeAreaInsets.top
        return Double(top ?? 20)
    }
    
    func addWorkoutGoalGraphSection() {
        let pbv = ProgessBarView(frame: CGRect(x: 10, y: 20, width: self.view.frame.size.width-20, height: 200))
        scrollView.addSubview(pbv)
    }
    
    func addWorkoutScheduleSection() {
        let scv = ScheduleView(frame: CGRect(x: 0, y: 220, width: self.view.frame.size.width, height: 100))
        scrollView.addSubview(scv)
        
        addShowRelatedPeopleList()
        addWorkoutRoutineList()
    }
    
    func addShowRelatedPeopleList() {
        //트네이너가 앱을 사용할 경우
        // - 티칭중인 회원이 1명 이상일 경우 - 리스트에 회원 보여주기
        // - 티칭중인 회원이 없는 경우 - 이 창 숨기기
        //회원이 앱을 사용할 경우
        // 헬스장에 다니지만 피티를 안받는 경우 - 헬스장 트레이너 리스트 보여주기
        // 피티를 받는 중일경우 - 헬스장 트레이너 리스트 보여주기(맨 앞은 자기 트레이너)
        // 헬스장에 다니지 않는 경우 - 이 창 숨기기
        let sv = PeopleListView(frame: CGRect(x: 10, y: 320, width: self.view.frame.size.width-20, height: 200))
        scrollView.addSubview(sv)
    }
    func addWorkoutRoutineList() {
        workoutRoutineBaseView.frame = CGRect(x: 10, y: 530, width: self.view.frame.size.width-20, height: 250)
        scrollView.addSubview(workoutRoutineBaseView)
        workoutRoutineBaseView.layer.borderWidth = 1
        workoutRoutineBaseView.layer.borderColor = UIColor.black.cgColor

        let baseViewLbl = UILabel()
        baseViewLbl.text = "Leg Day"
        baseViewLbl.frame = CGRect(x: (self.view.frame.size.width / 2) - 50, y: 10, width: 100, height: 30)
        baseViewLbl.textAlignment = .center
        workoutRoutineBaseView.addSubview(baseViewLbl)

        workoutRoutineBaseView.addSubview(CollectionView)
        CollectionView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 200)
    }

    
    func addBodyDataSection() {
        
//        bodyDataSectionView.frame = CGRect(x: 0, y: 800, width: self.view.frame.width, height: 800)
        scrollView.addSubview(bodyDataSectionView)
        
        let bisvGap = 20
        let bisvGapCount = 4
        let height = ((Int(self.view.frame.size.width) - (bisvGap * bisvGapCount)) / 3) + 100
 
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 10, width: self.view.frame.width, height: 50))
        titleLabel.text = "Data Info"
        titleLabel.textAlignment = .center
        bodyDataSectionView.addSubview(titleLabel)
        titleLabel.layer.borderColor = UIColor.black.cgColor
        titleLabel.layer.borderWidth = 1

        let bifiv = BodyInfoFixedInfoView(frame: CGRect(x: 0, y: 60, width: Int(self.view.frame.width), height: height))
        bodyDataSectionView.addSubview(bifiv)
        
        let bisv = BodyInfoSummaryView(frame: CGRect(x: 0, y: 60 + height, width: Int(self.view.frame.width) + 2, height: height))
        bodyDataSectionView.addSubview(bisv)
        bisv.layer.borderColor = UIColor.black.cgColor
        bisv.layer.borderWidth = 1
        
        bodyDataSectionView.frame = CGRect(x: 0, y: 800, width: Int(self.view.frame.width), height: height * 2 + 60)
        changeScrollContentHeight(height * 2 + 60)
    }
    
    func changeScrollContentHeight(_ bdsHeight:Int) {
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1300)
    }
    
    func addWorkoutProgressSection() {
        self.view.addSubview(workoutProgressView)
        workoutProgressView.frame = CGRect(x: 0, y: self.view.frame.height - 200, width: self.view.frame.width, height: 200)
        
        progressViewForWorkoutCount.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: 120)
        workoutProgressView.addSubview(progressViewForWorkoutCount)
        progressViewForWorkoutCount.backgroundColor = .green
        
//        progressViewForRatioOfCardio.frame = CGRect(x: 0, y: 200 + height + height, width: Int(self.view.frame.width), height: 120)
//        workoutProgressView.addSubview(progressViewForRatioOfCardio)
//        progressViewForRatioOfCardio.backgroundColor = .green
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ccvCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ccvCell", for: indexPath)
        ccvCell.layer.borderWidth = 1
        ccvCell.layer.borderColor = UIColor.black.cgColor
        return ccvCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("\(indexPath.section)   |   \(indexPath.row)")
    }
}
