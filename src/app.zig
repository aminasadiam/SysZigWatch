const std = @import("std");
const rl = @import("raylib");

pub fn RunApp() !void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "SysZigWatch - System Monitoring");
    defer rl.closeWindow();
    rl.setTargetFPS(60);

    // Set variables
    const cpu_usage = "0%";
    const disk_usage = "0%";

    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------

        // update cpu and disk usage from system.zig
        // TODO: update usages
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

        rl.drawLine(600, 80, 600, 180, rl.Color.black);
        rl.drawText(cpu_usage, 650, 120, 20, rl.Color.black);

        // DISK part
        rl.drawText("Disk", 60, 250, 20, rl.Color.light_gray);
        rl.drawRectangle(60, 280, 680, 100, rl.Color.light_gray);

        rl.drawLine(600, 280, 600, 380, rl.Color.black);
        rl.drawText(disk_usage, 650, 320, 20, rl.Color.black);

        //----------------------------------------------------------------------------------
    }
}
