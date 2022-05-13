//
//  WorkoutViewController.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-06.
//

import UIKit

let dm = DateManager()
let monthInfo = MonthInfo.shard
var startIndex = 0
var totalDays = 0
var totalDaysOfLastMonth = 0

class WorkoutViewController: UIViewController {
    let scrollView = UIScrollView()
    let topView = UIView()
    
    var i = 1
    let monthButton = UIButton()
 
    var width = 0.0
    var isMonthListViewShowing = false
    var monthListView: MonthListView? = nil
    
    var monthButtonCGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    private var workoutTV: WorkoutListTableView!
    let secondView = UIView()
        
    private lazy var calenderCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: width, height: width)
        let ccv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        ccv.register(DayCollectionViewCell.self, forCellWithReuseIdentifier: "ccvCell")
        ccv.backgroundColor = .white
        return ccv;
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "WORKOUT"
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectMonth(_:)), name: NSNotification.Name("selectMonth"), object: nil)
        
        monthInfo.month = dm.getCurrentMonthReturnInt()
        setMonth()
        calculateWidth()
        setScrollView()
        setTopView()
        setButtonsForManipulateCal()
        
        setCalenderCollectionView()
        
        confugureTableView()
        registerTableView()
        tableViewDelegate()
        
        setMonthListView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func calculateWidth() {
        width = (Double(self.view.frame.width) - 80) / 7
    }
    
    private func setScrollView() {
        self.view.addSubview(scrollView)
        scrollView.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height - 100)
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
    }
    
    private func setTopView() {
        topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 100)
        self.view.addSubview(topView)
    }
    
    private func setButtonsForManipulateCal() {
        let beforeBtn = UIButton()
        topView.addSubview(beforeBtn)
        beforeBtn.frame = CGRect(x: 10, y: 50, width: 100, height: 40)
        beforeBtn.setTitle("<<Before", for: .normal)
        beforeBtn.backgroundColor = .black
        beforeBtn.layer.borderWidth = 1
        beforeBtn.layer.borderColor = UIColor.black.cgColor
        beforeBtn.layer.cornerRadius = 10
        beforeBtn.addTarget(self, action: #selector(changeCal(_:)), for: .touchUpInside)
        beforeBtn.tag = 10
        topView.addSubview(monthButton)
        monthButton.frame = CGRect(x: self.view.frame.width / 2 - 40, y: 50, width: 80, height: 40)
        monthButton.setTitle("May", for: .normal)
        monthButton.backgroundColor = .black
        monthButton.layer.borderWidth = 1
        monthButton.layer.borderColor = UIColor.black.cgColor
        monthButton.layer.cornerRadius = 10
        monthButton.addTarget(self, action: #selector(showMonthListView), for: .touchUpInside)
        monthButtonCGRect = monthButton.frame
        
        let afterBtn = UIButton()
        topView.addSubview(afterBtn)
        afterBtn.frame = CGRect(x: self.view.frame.size.width - 110, y: 50, width: 100, height: 40)
        afterBtn.setTitle("After>>", for: .normal)
        afterBtn.backgroundColor = .black
        afterBtn.layer.borderWidth = 1
        afterBtn.layer.borderColor = UIColor.black.cgColor
        afterBtn.layer.cornerRadius = 10
        afterBtn.addTarget(self, action: #selector(changeCal(_:)), for: .touchUpInside)
        afterBtn.tag = 11
    }
    
    @objc func changeCal(_ btn:UIButton) {
        if (btn.tag == 10) {
            monthInfo.month -= 1
            
        } else {
            monthInfo.month += 1
        }
        setMonth()
        let month = dm.switchNumberToStrForMonth(numMonth: monthInfo.month)
        monthButton.setTitle(month, for: .normal)
        abc = true
        calenderCollectionView.reloadData()
    }
    
    private func setMonthListView() {
        monthListView = MonthListView(frame: CGRect(x: 0, y: monthButtonCGRect.origin.y + monthButtonCGRect.size.height , width: self.view.frame.width, height: self.view.frame.width - 100))
        self.view.addSubview(monthListView!)
        monthListView!.backgroundColor = .white
        monthListView?.isHidden = true
        isMonthListViewShowing = false
    }
    
    private func setLabels() {
        let workoutTimeLabel = UILabel()
        workoutTimeLabel.text = "68 minutes"
        secondView.addSubview(workoutTimeLabel)
        workoutTimeLabel.textAlignment = .center
        workoutTimeLabel.frame = CGRect(x: 10, y: 20, width: 100, height: 40)
        workoutTimeLabel.layer.borderWidth = 1
        workoutTimeLabel.layer.borderColor = UIColor.black.cgColor
        workoutTimeLabel.layer.cornerRadius = 10
        
        let totalSetsLabel = UILabel()
        totalSetsLabel.text = "14 Sets"
        secondView.addSubview(totalSetsLabel)
        totalSetsLabel.textAlignment = .center
        totalSetsLabel.frame = CGRect(x: 120, y: 20, width: 100, height: 40)
        totalSetsLabel.layer.borderWidth = 1
        totalSetsLabel.layer.borderColor = UIColor.black.cgColor
        totalSetsLabel.layer.cornerRadius = 10
        
        let totalVolumeLabel = UILabel()
        totalVolumeLabel.text = "1500 kg"
        secondView.addSubview(totalVolumeLabel)
        totalVolumeLabel.textAlignment = .center
        totalVolumeLabel.frame = CGRect(x: 230, y: 20, width: 100, height: 40)
        totalVolumeLabel.layer.borderWidth = 1
        totalVolumeLabel.layer.borderColor = UIColor.black.cgColor
        totalVolumeLabel.layer.cornerRadius = 10
    }
    @objc func showMonthListView() {
        if(isMonthListViewShowing) {
            monthListView?.isHidden = true
            isMonthListViewShowing = false
        }else {
            monthListView?.isHidden = false
            isMonthListViewShowing = true
        }
    }
    

    
    
}

extension WorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = WorkoutListTableView.dequeueReusableCell(withIdentifier: "cellIndentifier", for: indexPath) as! WorkoutListTableViewCell?
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func registerTableView() {
            workoutTV.register(WorkoutListTableViewCell.classForCoder(), forCellReuseIdentifier: "cellIdentifier")
        }

    func confugureTableView() {
        workoutTV = WorkoutListTableView()
        secondView.addSubview(workoutTV)
        let alm = AutolayouutManager()
        alm.setAutolayoutWithHeight(view: self.view, object: workoutTV, height: 300, left: 10, right: 10, top: (self.view.frame.width), hCenter: true)
    }
    
    func tableViewDelegate() {
        workoutTV.delegate = self
        workoutTV.dataSource = self
    }
}
var abc = true
extension WorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    private func setCalenderCollectionView() {
        self.view.backgroundColor = .white
        scrollView.addSubview(calenderCollectionView)
        calenderCollectionView.dataSource = self
        calenderCollectionView.delegate = self
        calenderCollectionView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 60 + (width*5))
        
        secondView.frame = CGRect(x: 0, y: calenderCollectionView.frame.size.height, width: self.view.bounds.size.width, height: 700)
        scrollView.addSubview(secondView)
        secondView.backgroundColor = .brown
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section)   |   \(indexPath.row)")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let ccvCell = calenderCollectionView.dequeueReusableCell(withReuseIdentifier: "ccvCell", for: indexPath) as! DayCollectionViewCell

        if (indexPath.row == 0) {
            ccvCell.layer.borderColor = UIColor.red.cgColor
        } else {
            ccvCell.layer.borderColor = UIColor.black.cgColor
        }
        
        ccvCell.layer.borderWidth = 1
        ccvCell.layer.cornerRadius = 15
        ccvCell.cellLabel.textAlignment = .center

        
        ccvCell.cellLabel.textColor = UIColor.black
        
        if(startIndex != 1 && abc == true) {
            i = totalDaysOfLastMonth - startIndex + 2
            abc = false
        }
        if((indexPath.section == 0) && (i > totalDaysOfLastMonth)) {
            i = 1
        }
        if((indexPath.section == 4) && (i > totalDays)) {
            i = 1
        }
        if(indexPath.section == 0) {
            if(i <= totalDays && (i > 7)) {
                ccvCell.cellLabel.textColor = UIColor.lightGray
            }
            ccvCell.cellLabel.text = "\(i)"
        }else if(indexPath.section == 4) {
            ccvCell.cellLabel.text = "\(i)"
            if(i < 7){
                ccvCell.cellLabel.textColor = UIColor.lightGray
            }
        }else {
            ccvCell.cellLabel.text = "\(i)"
        }
        i += 1
        return ccvCell
    }
    
    @objc func selectMonth(_ notification: Notification) {
        monthListView?.isHidden = true
        isMonthListViewShowing = false
        i = 1
        setMonth()
        let month = dm.switchNumberToStrForMonth(numMonth: monthInfo.month)
        monthButton.setTitle(month, for: .normal)
        abc = true
        calenderCollectionView.reloadData()
    }
    func setMonth() {
        startIndex = dm.getFirstDayOfMonth(monthInfo.month)
        totalDays = dm.numberOfDaysOfThisMonth(2022, monthInfo.month)
        totalDaysOfLastMonth = dm.numberOfDaysOfThisMonth(2022, monthInfo.month-1)
    }

}

