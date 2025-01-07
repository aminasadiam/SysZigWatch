const std = @import("std");
const rl = @import("raylib");

pub fn RunApp() !void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "SysZigWatch - System Monitoring");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------
        // TODO: Update your variables here
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.white);

        rl.drawText("SysZigWatch - system monitoring...", 220, 10, 20, rl.Color.light_gray);

        // CPU part
        rl.drawText("CPU", 60, 50, 20, rl.Color.light_gray);
        rl.drawRectangle(60, 80, 680, 100, rl.Color.light_gray);

        // DISK part
        rl.drawText("Disk", 60, 250, 20, rl.Color.light_gray);
        rl.drawRectangle(60, 280, 680, 100, rl.Color.light_gray);

        //----------------------------------------------------------------------------------
    }
}
