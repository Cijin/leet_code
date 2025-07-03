fn two_sum(comptime T: type, input: []T, target: T) [2]T {
    var result: [2]T = undefined;

    var j: usize = 0;
    for (input, 0..) |_, i| {
        j = i + 1;
        while (j < input.len) : (j += 1) {
            if (input[i] + input[j] == target) {
                result[0] = @intCast(i);
                result[1] = @intCast(j);

                return result;
            }
        }
    }

    return result;
}

test "two sum unsigned int" {
    const tests = [_]struct {
        input: []u32,
        target: u32,
        expected: [2]u32,
    }{
        .{
            .input = @constCast(&[_]u32{ 3, 2, 4 }),
            .target = 6,
            .expected = [2]u32{ 1, 2 },
        },
        .{
            .input = @constCast(&[_]u32{ 2, 7, 11, 15 }),
            .target = 9,
            .expected = [2]u32{ 0, 1 },
        },
        .{
            .input = @constCast(&[_]u32{ 3, 3 }),
            .target = 6,
            .expected = [2]u32{ 0, 1 },
        },
    };

    for (tests) |t| {
        const got = two_sum(u32, t.input, t.target);
        try testing.expectEqualSlices(u32, t.expected[0..], got[0..]);
    }
}

const std = @import("std");
const testing = std.testing;
