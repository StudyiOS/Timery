//
//  Core.swift
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
    description: "A template for a new Core modules",
    attributes: [
        name,
        author,
        currentDate
    ],
    items: CoreTemplate.allCases.map { $0.item }
)

enum CoreTemplate: CaseIterable {
    case package
    case project
    case test

    // 템플릿 내부에 추가할 파일.
    var item: Template.Item {
        switch self {
        case .package:
            return .file(path: .basePath + "/Package.swift",
                        templatePath: "Package.stencil")
        case .project:
            return .file(path: .basePath + "/Sources/Project.swift",
                         templatePath: "Project.stencil")
        case .test:
            return .file(path: .basePath + "/Tests/" + .testName + "/" + .testName + ".swift",
                         templatePath: "Test.stencil")
        }
    }
}

// 템플릿을 추가할 기본 경로.
extension String {
    static var basePath: Self {
        return "Modules/Core/\(name)"
    }

    static var testName: Self {
        return "\(name)Tests"
    }
}
