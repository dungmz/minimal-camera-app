import SwiftUI
import AVFoundation

struct CameraView: View {
    @StateObject private var model = CameraModel()

    var body: some View {
        CameraPreview(session: model.session)
            .ignoresSafeArea()
            .onAppear {
                model.checkPermissions()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    model.session.startRunning()
                }
            }
    }
}