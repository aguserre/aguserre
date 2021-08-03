//
//  FakeModels.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import Foundation

let personalFake = Personal(aboutMe: presentationText, personalData: personalDataFake)
let personalDataFake = [PersonalData(title: "Edad",
                                           description: "31"),
                                PersonalData(title: "Nacionalidad",
                                           description: "Argentino"),
                                PersonalData(title: "Localidad",
                                           description: "Fake, Buenos Aires, Argentina (CP.FAKE)"),
                                PersonalData(title: "Correo Electronico",
                                           description: "fake@gmail.com"),
                                PersonalData(title: "Fecha de nacimiento",
                                           description: "21/12/1989"),
                                PersonalData(title: "Estado Civil",
                                           description: "Soltero"),
                                PersonalData(title: "Permiso de conducir",
                                           description: "B")
]

let academyFake = Academy(academyData: academyDataFake)
let academyDataFake = [AcademyData(title: "Analista de Sistemas",
                                           subtitle: "Mar 2017 - Actualidad",
                                           description: "ESBA, Capital Federal, Buenos Aires.\nEstudiante de Analista de Sistemas. Instituto ESBA, sede Barrio Norte. Capital Federal. 30/36 materias aprobadas.", status: .onCurse),
                               AcademyData(title: "Bachiller Ciencias Naturales",
                                           subtitle: "Dic 2007",
                                           description: "Escuela Normal Media Numero 41, Bragado, Buenos Aires, Argentina.", status: .completed),
                               AcademyData(title: "Diseñador de páginas web",
                                           subtitle: "Mar 2008 - Dic 2008",
                                           description: "Sistemas y Capacitacion S.R.L., Bragado, Buenos Aires, Argentina.", status: .paused),
                               AcademyData(title: "Curso avanzado de Auditoría Interna",
                                           subtitle: "Jul 2016",
                                           description: "BDO, Capital Federal, Buenos Aires.", status: .completed),
                               AcademyData(title: "Curso avanzado de software IDEA",
                                           subtitle: "Ago 2016",
                                           description: "BDO, Capital Federal, Buenos Aires.", status: .completed),
                               AcademyData(title: "Curso avanzado de Programación SQL",
                                           subtitle: "Jul 2017",
                                           description: "Educación IT, Capital Federal, Buenos Aires.", status: .abandoned),
                               AcademyData(title: "Desarrollador iOS",
                                           subtitle: "Mar 2019 - Sep 2019",
                                           description: "Digital House, Capital Federal, Buenos Aires.", status: .completed),
                               AcademyData(title: "Curso TDD",
                                           subtitle: "Mar 2021 - Abr 2021",
                                           description: "10Pines, Capital Federal", status: .completed)
]

let skillsFake = Skills(skillsData: skillsDataFake)
let skillsDataFake = [SkillsData(name: "Microsoft Office", subtitle: "Excel, Word, Access, PowerPoint, Outlook", percent: 0.80),
                  SkillsData(name: "Bases de datos", subtitle: "SQL, Access, Mongo",percent: 0.55),
                  SkillsData(name: "Herramientas gráficas", subtitle: "Photoshop",percent: 0.45),
                  SkillsData(name: "Software de Auditoria", subtitle: "IDEA, ACL",percent: 0.80),
                  SkillsData(name: "Lenguajes de programación", subtitle: "Swift, Objective-C, SwiftUI",percent: 0.90),
                  SkillsData(name: "API Testing", subtitle: "Postman",percent: 0.95),
                  SkillsData(name: "Software de gestión", subtitle: "Jira, Trello",percent: 0.80),
                  SkillsData(name: "Repositorios", subtitle: "Gitlab, Github, Bitbucket",percent: 0.90)]

let sectionsFake = experienceFake.jobsData.map { $0.type }.removingDuplicates()
let experienceFake = JobExperience(jobsData: jobsFake)
let jobsFake = [Job(type: .other, name: "GoodPeople", position: "Vendedor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
            Job(type: .auditor, name: "Bertora", position: "Auditor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
            Job(type: .auditor, name: "BDO", position: "Auditor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
            Job(type: .auditor, name: "Tarshop", position: "Auditor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
            Job(type: .developer, name: "Gob. Ciudad", position: "iOS Dev", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
            Job(type: .developer, name: "FluxIt", position: "iOS Dev", dateStart: "dsafas", dateEnd: "safjnakd", description: "iahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaeg")]

let gridItemsFake = [GridItem(height: 200, imageString: "github", url: "https://github.com/aguserre"),
                             GridItem(height: 140, imageString: "linkedin", url: "https://www.linkedin.com/in/agustin-errecalde-a853b767/"),
                             GridItem(height: 110, imageString: "instagram", url: "https://www.instagram.com/agustinerrecalde/"),
                             GridItem(height: 120, imageString: "telegram", url: "tg://resolve?domain=@agustinerre"),
                             GridItem(height: 200, imageString: "whatsapp", url: "https://api.whatsapp.com/send?phone=+5492342514756"),
                             GridItem(height: 150, imageString: "mail", url: "mailto:eagustiin@gmail.com"),
                             GridItem(height: 100, imageString: "facebook", url: "https://www.facebook.com/eagustiin"),
                             GridItem(height: 150, imageString: "twitter", url: "https://twitter.com/eagustiin")]
