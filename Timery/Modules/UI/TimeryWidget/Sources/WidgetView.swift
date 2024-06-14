import WidgetKit
import SwiftUI

struct WidgetView: View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

#Preview {
    WidgetView(entry: Provider.Entry(date: Date(),
                                     configuration: .init(favoriteEmoji: "🫶🏻")))
}
