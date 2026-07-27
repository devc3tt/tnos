import Quickshell.Hyprland

Item {
    HyprlandWorkspace {
        id: workspace
    }
    Text {
        id: workspaceText
        text: workspace.monitor.activeWorkspace
    }
}
