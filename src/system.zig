const std = @import("std");
const fs = std.fs;
const os = std.os;

pub fn get_cpu_usage() !f32 {
    if (os.linux) {
        const proc_stat = try std.fs.cwd().openFile("proc/stat", .{ .read = true });
        defer proc_stat.close();

        var buffer: [4096]u8 = undefined;
        const read_len = try proc_stat.read(buffer[0..]);

        const contents = buffer[0..read_len];
        const fields = std.mem.split(contents, " ");

        if (fields.len < 5) return;

        const total_jiffies: u64 = try std.fmt.parseInt(u64, fields[1], 10) + try std.fmt.parseInt(u64, fields[2], 10) + try std.fmt.parseInt(u64, fields[3], 10);
        const idle_jiffies: u64 = try std.fmt.parseInt(u64, fields[4], 10);

        const usage_percentage = ((total_jiffies - idle_jiffies) * 100) / total_jiffies;

        return usage_percentage;
    } else if (os.windows) {}
}

pub fn get_disk_usage() !f32 {
    if (os.linux) {
        const statvfs = fs.statvfs;
        const mount_path = "/"; // Root mount path

        var stat: statvfs = undefined;
        try fs.statvfs(mount_path, &stat);

        const total_blocks = stat.f_blocks;
        const free_blocks = stat.f_bfree;

        const total_bytes = total_blocks * stat.f_frsize;
        const free_bytes = free_blocks * stat.f_frsize;

        const used_bytes = total_bytes - free_bytes;
        const usage_percentage = (used_bytes * 100) / total_bytes;

        return usage_percentage;
    } else if (os.windows) {
        // Windows-specific implementation
    }
}
