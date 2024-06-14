import WidgetKit
import SwiftUI

@main
struct TimeryWidgetWidget: Widget {
    let kind: String = "TimeryWidgetWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .configurationDisplayName("TimeryWidget Widget")
        .description("This is a simple widget for TimeryWidget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

#Preview {
    TimeryWidgetWidget() as! any View
}
