const print = @import("std").debug.print;
const app = @import("app.zig");

pub fn main() !void {
    try app.RunApp();
}
