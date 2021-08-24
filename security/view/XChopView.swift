//
//  XChopView.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 02.08.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation
import UIKit

class XChopView: XBaseView, UITableViewDataSource, UITableViewDelegate{
    
    var selectedRow = 0
    var title: UITextView!
    public var delegate: XChopMainViewDelegate?
    //private var cellStyle: XChopCell.chopCellStyle

    var list: [(img: UIImage?, name: String, adres: String, num: String, mail: String)] = []

    private var myTableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
        addlist()
        myTableView.register(XChopCell.self, forCellReuseIdentifier: XChopCell.cellId)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initViews(){
        myTableView = UITableView()
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: XChopCell.cellId)
        myTableView.dataSource = self
        myTableView.delegate = self

        addSubview(myTableView)
        setOnConstraints()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: false)
        //let cell: XChopCell = (tableView.dequeueReusableCell(withIdentifier: XChopCell.cellId, for: indexPath) as? XChopCell)!
        //cell.backgroundColor = UIColor.red
        print("Num: \(list[indexPath.row].name)")
        print("\(list[indexPath.row].adres)")
        print(" \(list[indexPath.row].num)")
        
        delegate?.showAlert(name: list[indexPath.row].name,adres: list[indexPath.row].adres,num: list[indexPath.row].num,mail: list[indexPath.row].mail)
        
        
    }
    
    func mail(mail: String) {
        guard let url = URL(string: "mailto://\(mail)"), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: XChopCell = (tableView.dequeueReusableCell(withIdentifier: XChopCell.cellId, for: indexPath) as? XChopCell)!
        cell.setContent(img: list[indexPath.row].img,name: list[indexPath.row].name)
        //cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.width)
        //cell.setStyle(cellStyle)
        //cell.setStyle(cellStyle)
        
        
        
        return cell
    }



    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150
    }
    
    func image( _ image:UIImage, withSize newSize:CGSize) -> UIImage {

        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!.withRenderingMode(.automatic)
    }

    func setOnConstraints() {
       
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            myTableView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0),
            myTableView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 0),
            myTableView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 50),
        ])
    }

    func addlist() {
        if (XTargetUtils.target == .saratov)
        {
            list = [
                (img: nil, name: "МОВО по г. Саратову - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "", mail: ""),
                (img: nil, name: "ОВО по г. Аткарску - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88455234040 88455233401", mail: ""),
                (img: nil, name: "ОВО по г. Балаково - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88453358250 88453358275 88453358285", mail: ""),
                (img: nil, name: "МОВО по г. Балашову - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88454548010 88454540474", mail: ""),
                (img: nil, name: "МОВО по г. Вольску - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88459372250 88459352111 88459171788", mail: ""),
                (img: nil, name: "ОВО по г. Ершову - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88456451104", mail: ""),
                (img: nil, name: "ОВО по г. Калининску - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88454931758 88454931896", mail: ""),
                (img: nil, name: "ОВО по г. Красноармейску - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88455021465 88455021253", mail: ""),
                (img: nil, name: "ОВО по г. Красному Куту - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88456052340 88456052898", mail: ""),
                (img: nil, name: "ОВО по г. Марксу - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88456751169 88456751938", mail: ""),
                (img: nil, name: "ОВО по г. Новоузенску - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88456221461 88456222064", mail: ""),
                (img: nil, name: "ОВО по г. Петровску - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88455529445 88455529446", mail: ""),
                (img: nil, name: "ОВО по г. Пугачеву - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88457422670 88457422672", mail: ""),
                (img: nil, name: "ОВО по г. Ртищево - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88454041859 88454022730", mail: ""),
                (img: nil, name: "ОВО по г. Хвалынску - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "8845921758", mail: ""),
                (img: nil, name: "МОВО по г. Энгельсу - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88453745098 88453779584", mail: ""),
                (img: nil, name: "ОВО по ЗАТО п. Светлый - филиал ФГКУ 'УВО ВНГ России по Саратовской области'", adres: "", num: "88455843331", mail: "")
            ]
        }
        else
        {
            list = [
                (img: UIImage(named: "ic_sec_delta"), name: "DELTA Системы Безопасности", adres: "Казань, ул. Петербургская,   д. 25В, пом. 5", num: "", mail: ""),
                (img: UIImage(named: "ic_sec_tigr"), name: "ГК Тигр", adres: "г. Москва, Щёлковское ш., д. 2А, (БЦ Дельта, эт. 8, оф. 835)", num: "88007778536", mail: "tender@gk-tigr.ru"),
                (img: nil, name: "ИП Давидянц Арсен Сергеевич", adres: "г. Владикавказ, ул. А. Кесаева, д.4", num: "+79888351408", mail: "ars68@mail.ru"),
                (img: UIImage(named: "ic_sec_ksb"), name: "Некоммерческое партнерство «Комплексные системы безопасности»", adres: "г. Владикавказ, ул. Калоева, д. 412", num: "+78672403594", mail: "csb2010@mail.ru"),
                (img: UIImage(named: "ic_sec_alarm"), name: "НТ ЗАО «Аларм»", adres: "Беларусь, г. Минск, ул. Ф.Скорины, д. 51, лит. Ж, к., оф. 308А", num: "+375172859401", mail: "alarm@alarm.by"),
                (img: UIImage(named: "ic_sec_avangardsb"), name: "ООО «Авангард-СБ»", adres: "г. Кемерово, Кузнецкий проспект, д. 103 к. а, оф. 304", num: "+73842280211", mail: ""),
                (img: UIImage(named: "ic_sec_alf"), name: "ООО «Альф-Сервис Групп»»", adres: "г. Москва, ул. Рогова, д. 15, корп. 1, комната 15", num: "+74959791115", mail: "support@alfservice.ru"),
                (img: UIImage(named: "ic_sec_kobra_garant"), name: "ООО «Кобра Гарант»", adres: "г. Москва, ул. Орджоникидзе, д. 11, стр. 43", num: "+74959795082", mail: "info@cobragarant.ru"),
                (img: UIImage(named: "ic_sec_monitoringovie_sistemy"), name: "ООО «Мониторинговые системы»", adres: "г.Набережные Челны, ул. Ш.Усманова, д.109а", num: "+78552323288", mail: "ms.ohrana@mail.ru"),
                (img: UIImage(named: "ic_sec_omicron"), name: "ООО «Омикрон»", adres: "г. Орёл, ул. 7 Ноября, д. 16 корпус а, пом. 2", num: "+74862402096", mail: "info@omicron57.ru"),
                (img: UIImage(named: "ic_sec_filin"), name: "ООО «Филин»", adres: "\tг. Ульяновск, ул. Локомотивная, д. 91/2.", num: "+78422357040", mail: "Filin0121@yandex.ru"),
                (img: UIImage(named: "ic_sec_zhilstroischit"), name: "ООО Охранное предприятие «Жилстрой-щит»", adres: "г. Волгодонск, ул.Ленинградская, д. 10", num: "+78639235740", mail: ""),
                (img: UIImage(named: "ic_sec_security_gard"), name: "ООО «Секьюрити Гард»", adres: "г. Москва, пл. Спартаковская, д. 14, стр. 1, 1 этаж, оф. 121", num: "+74956410288", mail: "safety@securguard.ru"),
                (img: UIImage(named: "ic_security_profi_ops"), name: "ООО «Секьюрити-профи «ОПС»", adres: "г. Йошкар-Ола, ул. Свердлова, д. 46", num: "+78002348424", mail: ""),
                (img: UIImage(named: "ic_sec_stitssb"), name: "ООО «Строительство инженерно-технических сетей и систем безопасности»", adres: "МО, г. Подольск, ул. Февральская, д.57, стр.1, под.1, эт.2, оф.23", num: "+74954112535", mail: "stitssb@gmail.com"),
                (img: UIImage(named: "ic_sec_triomad"), name: "ООО «Триомад»", adres: "Казахстан, г. Алматы, пр. Рыскулова д. 140/4, оф. 310", num: "+77272208860", mail: "mitvit84@gmail.com"),
                (img: UIImage(named: "ic_sec_cerber"), name: "ООО «Цербер»", adres: "г. Пермь, ул. Куйбышева, д. 2", num: "+73422061912", mail: "info@cerbergroup.ru"),
                (img: UIImage(named: "ic_sec_arsenal"), name: "ООО ЧОО «Арсенал»", adres: "г. Москва, ул. Генерала Тюленева, д. 4Ас1", num: "+74952039798", mail: "info@myoxrana.ru"),
                (img: UIImage(named: "ic_sec_triglav"), name: "ООО ЧОО «ТРИГЛАВ»", adres: "г. Можайск, пр-д Мира, дом 3, пом. А8,А9", num: "+79859721818", mail: ""),
                (img: UIImage(named: "ic_sec_fortsb"), name: "ООО ЧОО «ФортСБ»", adres: "г. Воронеж, пр. Труда, 39", num: "+79204330391", mail: "fortcb@yandex.ru"),
                (img: UIImage(named: "ic_sec_litaniya_m"), name: "ООО ЧОП «Литания-М»", adres: "г. Москва, ул. Шумкина, д. 20, стр. 1", num: "+74959564917", mail: "info@litania.ru"),
                (img: UIImage(named: "ic_sec_omega"), name: "ООО ЧОП «Омега»", adres: "г.Старый Оскол, м-он Зеленый Лог, д.3", num: "+74725446065", mail: "omega-oskol@mail.ru"),
                (img: UIImage(named: "ic_sec_falcon"), name: "ООО ЧОП «Фалькон Крым»", adres: "г. Симферополь, ул. Тургенева, д. 30", num: "+73652621150", mail: "44fz@falkon82.ru"),
                (img: UIImage(named: "ic_sec_farb_m"), name: "ООО ЧОП «Фарб-М»", adres: "г. Йошкар-Ола, ул. Машиностроителей, д. 16 а", num: "+78362405405", mail: "service@farbm.ru"),
                (img: UIImage(named: "ic_sec_unimax"), name: "ООО «ЮНИМАКС»", adres: "МО, г. Москва, ш. Энтузиастов, д.82/2, к.1", num: "+74957399655", mail: ""),
                (img: UIImage(named: "ic_sec_egida"), name: "ОПС ТОО Эгида", adres: "Казахстан, г.Караганда, ул. Лободы, д. 11а", num: "+77212411421", mail: ""),
                (img: UIImage(named: "ic_sec_sibtechmontazh"), name: "Сиб Тех Монтаж", adres: "г. Тюмень, ул. Михаила Сперанского, д. 37", num: "+73452548151", mail: ""),
                (img: nil, name: "Технологии и Системы", adres: "Р. Крым, г. Ялта", num: "+79789173404", mail: ""),
                (img: UIImage(named: "ic_sec_asia_security_as"), name: "ТОО Азия Секьюрити АС", adres: "Казахстан, г. Астана, ул. Сейфуллина, д. 65", num: "+77172521072", mail: ""),
                (img: UIImage(named: "ic_sec_tretiy_rim"), name: "Третий Рим", adres: "г. Михайловск, ул. Демидова, д. 28", num: "+78652602400", mail: "info@trety-rim.ru"),
                (img: UIImage(named: "ic_sec_uvo_krsndr"), name: "УВО Краснодарского края", adres: "г. Краснодар, ул. Новокузнечная, д. 125", num: "+78612552050", mail: ""),
                (img: UIImage(named: "ic_sec_uvo_samara"), name: "УВО по Самарской области", adres: "г. Самара, ул. Стара Загора, д. 159Б", num: "+78469952922", mail: ""),
                (img: UIImage(named: "ic_sec_uvo_saratov"), name: "УВО по Саратовской области", adres: "г. Саратов, ул. Рабочая, д. 59", num: "+78452741222", mail: ""),
                (img: UIImage(named: "ic_sec_uvo_stavropol"), name: "УВО по Ставропольскому краю", adres: "г. Ставрополь, ул. Калинина, д. 3", num: "+78652283302", mail: ""),
                (img: UIImage(named: "ic_sec_uvo_msk"), name: "УВО по городу Москве", adres: "г. Москва, ул. Люблинская, д. 16", num: "+74953510060", mail: ""),
                (img: UIImage(named: "ic_sec_uvo_krim"), name: "УВО по Республике Крым", adres: "г. Симферополь, ул. Миллера, д. 4", num: "+73652541459", mail: ""),
                (img: UIImage(named: "ic_sec_uvo_tatarstan"), name: "УВО по Республике Татарстан", adres: "г. Казань, ул. Лево-Булачная, д. 20", num: "+78432314411", mail: ""),
                (img: UIImage(named: "ic_sec_uli_gaya"), name: "Хозяйственное общество «Улы Гая»", adres: "Туркмения, г. Ашхабад, ул. Мир 6, д.64", num: "+99312965509", mail: "ulygayasec@gmail.com"),
                (img: UIImage(named: "ic_sec_centr_bezopasnosti_ufa"), name: "Центр Безопасности Уфа", adres: "г. Уфа, ул. Р. Зорге, д. 33/1, оф. 3", num: "+73472161616", mail: ""),
                (img: UIImage(named: "ic_sec_kazachyastrazha"), name: "ЧОО «Казачья стража»", adres: "г. Москва, пр-кт Мира, д. 49А", num: "+79296790200", mail: "Info@kazakstraja.ru"),
                (img: UIImage(named: "ic_sec_strela"), name: "ЧОО «Стрела»", adres: "г. Волгоград, пр-кт им. Маршала Г.К.Жукова, д. 141", num: "+79370904048", mail: "strela-ohrana@yandex.ru"),
                (img: UIImage(named: "ic_sec_dozor_c"), name: "ООО ЧОО «Дозор-С»", adres: "г. Ковров, ул. Еловая, д.98, оф. 1", num: "+79005886311", mail: "dozor.kovrov@mail.ru"),
                (img: UIImage(named: "ic_sec_pravoporyadok"), name: "ЧОП «Правопорядокъ-I»", adres: "МО, Люберецкий р-н, раб. п. Малаховка, ул.Шоссейная, д. 1 кор. а, оф. 6", num: "+79153569611", mail: "secretary@pp-1.ru"),
                (img: UIImage(named: "ic_sec_sova"), name: "ЧОП «Сова»", adres: "г. Казань, Оренбургский тракт, 20, оф. 211, этаж 2", num: "+78432501042", mail: ""),
                (img: UIImage(named: "ic_sec_favorit"), name: "ЧОП «Фаворит-СБ»", adres: "МО,с. Красное, ул. Строителей, д. 5, корп. 2, оф. 19", num: "+74958409071", mail: ""),
                (img: UIImage(named: "ic_sec_three_a"), name: "Three A", adres: "Казахстан, г. Алматы, ул.Желтоксан, д.27, кв.3", num: "+77010818543", mail: "Opt@threea.kz"),
                (img: UIImage(named: "ic_sokol_sec"), name: "ТОО «СОКОЛ СЕКЬЮРИТИ СЕРВИС»", adres: "г.Нур-Султан, ул.Досмухаммедулы, д.1, оф. 17 \n г. Соликамск, ул. Советская, 56/2, офис 23", num: "+77071026060 +77071036060", mail: "sokol.security@mail.ru"),
                (img: UIImage(named: "ic_sherif"), name: "ООО «ОА «Шериф-Безопасность»", adres: "г. Березники, ул. Юбилейная, 127. Бизнес центр 'НЭО', 2 этаж, офис 210", num: "+73424290161 +73425370826", mail: "sheriff@uralkali.com")
            ]
        }

    }
}
