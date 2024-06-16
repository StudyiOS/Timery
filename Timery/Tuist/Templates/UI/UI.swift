//
//  UI.swift
//
//
//  Created by 성현관 on 6/5/24.
//
import ProjectDescription

// scaffold 명령어 시 받을 인자.
let name: Template.Attribute = .required("name")
let author: Template.Attribute = .required("author")
let currentDate: Template.Attribute = .required("currentDate")

// 템플릿 선언.
let coreTemplate = Template(
    description: "A template for a new UI modules",
    attributes: [
        name,
        author,
        currentDate
    ],
    items: UITemplate.allCases.map { $0.item }
)

enum UITemplate: CaseIterable {
    case package
    case viewController
    case infoPlist
    case test

    // 템플릿 내부에 추가할 파일.
    var item: Template.Item {
        switch self {
        case .package:
            return .file(path: .basePath + "/Package.swift", // 생성 들어가는 경로
                        templatePath: "Package.stencil") // 어떤거 만들지 정의된 .stencil 템플릿 경로
        case .viewController:
            return .file(path: .basePath + "/Sources/ViewController.swift",
                         templatePath: "ViewController.stencil")
        case .infoPlist:
            return .file(path: .basePath + "/\(name)-Info.plist", 
                        templatePath: "InfoPlist.stencil")
        case .test:
            return .file(path: .basePath + "/Tests/" + .testName + "/" + .testName + ".swift",
                         templatePath: "Test.stencil")
        }
    }
}

// 템플릿을 추가할 기본 경로.
extension String {
    static var basePath: Self {
        return "Modules/UI/\(name)"
    }

    static var testName: Self {
        return "\(name)Tests"
    }
}
