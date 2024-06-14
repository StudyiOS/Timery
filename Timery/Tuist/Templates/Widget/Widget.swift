//
//  Domain.swift
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
    description: "A template for a new Domain modules",
    attributes: [
        name,
        author,
        currentDate
    ],
    items: WidgetTemplate.allCases.map { $0.item }
)

enum WidgetTemplate: CaseIterable {
    case package
    case widget
    case widgetView
    case timelineProvider
    case infoPlist
    case test

    // 템플릿 내부에 추가할 파일.
    var item: Template.Item {
        switch self {
        case .package:
            return .file(path: .basePath + "/Package.swift",
                        templatePath: "Package.stencil")
        case .widget:
            return .file(path: .basePath + "/Sources/Widget.swift",
                         templatePath: "Widget.stencil")
        case .widgetView:
            return .file(path: .basePath + "/Sources/WidgetView.swift",
                         templatePath: "WidgetView.stencil")
        case .timelineProvider:
            return .file(path: .basePath + "/Sources/TimelineProvider.swift",
                         templatePath: "TimelineProvider.stencil")
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
