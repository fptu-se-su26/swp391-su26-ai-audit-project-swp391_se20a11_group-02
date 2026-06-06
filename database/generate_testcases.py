import sys

# Define all 55 problems with their test cases
# Format: problem_id -> [(input, output), (input, output)]
testcases = {
    # Contest Problems
    990: [
        ("4\\n2 7 11 15\\n9", "0 1"),
        ("3\\n3 2 4\\n6", "1 2")
    ],
    991: [
        ("121", "true"),
        ("-121", "false")
    ],
    992: [
        ("3\\nflower flow flight", "fl"),
        ("3\\ndog racecar car", "")
    ],
    993: [
        ("()[]{}", "true"),
        ("([)]", "false")
    ],
    994: [
        ("3\\n1 2 4\\n3\\n1 3 4", "1 1 2 3 4 4"),
        ("0\\n\\n0\\n", "")
    ],
    
    # Practice Problems
    1001: [
        ("hello", "olleh"),
        ("Hannah", "hannaH")
    ],
    1002: [
        ("3", "1\\n2\\nFizz"),
        ("5", "1\\n2\\nFizz\\n4\\nBuzz")
    ],
    1003: [
        ("aba", "true"),
        ("abc", "false")
    ],
    1004: [
        ("anagram nagaram", "true"),
        ("rat car", "false")
    ],
    1005: [
        ("3\\n2 2 1", "1"),
        ("5\\n4 1 2 1 2", "4")
    ],
    1006: [
        ("3\\n3 2 3", "3"),
        ("7\\n2 2 1 1 1 2 2", "2")
    ],
    1007: [
        ("5\\n0 1 0 3 12", "1 3 12 0 0"),
        ("2\\n0 0", "0 0")
    ],
    1008: [
        ("4\\n1 2 3 1", "true"),
        ("4\\n1 2 3 4", "false")
    ],
    1009: [
        ("3\\n3 0 1", "2"),
        ("2\\n0 1", "2")
    ],
    1010: [
        ("4\\n1 2 2 1\\n2\\n2 2", "2"),
        ("3\\n4 9 5\\n5\\n9 4 9 8 4", "9 4")
    ],
    1011: [
        ("16", "true"),
        ("3", "false")
    ],
    1012: [
        ("hello", "holle"),
        ("leetcode", "leotcede")
    ],
    1013: [
        ("abc ahbgdc", "true"),
        ("axc ahbgdc", "false")
    ],
    1014: [
        ("leetcode", "0"),
        ("loveleetcode", "2")
    ],
    1015: [
        ("8\\n4 3 2 7 8 2 3 1", "5 6"),
        ("2\\n1 1", "2")
    ],
    1016: [
        ("2", "1"),
        ("4", "3")
    ],
    1017: [
        ("4", "4"),
        ("25", "1389537")
    ],
    1018: [
        ("2", "2"),
        ("3", "3")
    ],
    1019: [
        ("3\\n10 15 20", "15"),
        ("10\\n1 100 1 1 1 100 1 1 100 1", "6")
    ],
    1020: [
        ("4\\n1 2 3 1", "4"),
        ("5\\n2 7 9 3 1", "12")
    ],
    1021: [
        ("6\\n7 1 5 3 6 4", "5"),
        ("5\\n7 6 4 3 1", "0")
    ],
    1022: [
        ("9\\n-2 1 -3 4 -1 2 1 -5 4", "6"),
        ("1\\n1", "1")
    ],
    1023: [
        ("3\\n1 2 3\\n3\\n2 5 6", "1 2 2 3 5 6"),
        ("1\\n1\\n0", "1")
    ],
    1024: [
        ("3\\n1 1 2", "2"),
        ("10\\n0 0 1 1 1 2 2 3 3 4", "5")
    ],
    1025: [
        ("4\\n3 2 2 3\\n3", "2"),
        ("8\\n0 1 2 2 3 0 4 2\\n2", "5")
    ],
    1026: [
        ("4\\n1 3 5 6\\n5", "2"),
        ("4\\n1 3 5 6\\n2", "1")
    ],
    1027: [
        ("Hello World", "5"),
        ("   fly me   to   the moon  ", "4")
    ],
    1028: [
        ("3\\n1 2 3", "1 2 4"),
        ("1\\n9", "1 0")
    ],
    1029: [
        ("11 1", "100"),
        ("1010 1011", "10101")
    ],
    1030: [
        ("4", "2"),
        ("8", "2")
    ],
    1031: [
        ("19", "true"),
        ("2", "false")
    ],
    1032: [
        ("1", "A"),
        ("28", "AB")
    ],
    1033: [
        ("A", "1"),
        ("AB", "28")
    ],
    1034: [
        ("27", "true"),
        ("0", "false")
    ],
    1035: [
        ("16", "true"),
        ("5", "false")
    ],
    1036: [
        ("16", "true"),
        ("14", "false")
    ],
    1037: [
        ("3\\n3 2 1", "1"),
        ("2\\n1 2", "2")
    ],
    1038: [
        ("3\\n1 2 3\\n2\\n1 1", "1"),
        ("2\\n1 2\\n3\\n1 2 3", "2")
    ],
    1039: [
        ("6\\n1 1 0 1 1 1", "3"),
        ("5\\n1 0 1 1 0", "2")
    ],
    1040: [
        ("USA", "true"),
        ("FlaG", "false")
    ],
    1041: [
        ("100", "202"),
        ("-7", "-10")
    ],
    1042: [
        ("5\\n5 4 3 2 1", "Gold Medal Silver Medal Bronze Medal 4 5"),
        ("1\\n10", "Gold Medal")
    ],
    1043: [
        ("28", "true"),
        ("7", "false")
    ],
    1044: [
        ("4\\nHello Alaska Dad Peace", "Alaska Dad"),
        ("2\\nomk adsdf", "adsdf")
    ],
    1045: [
        ("4\\n1 2 2 3", "2"),
        ("3\\n1 1 2", "1")
    ],
    1046: [
        ("4\\n4 2 1 3", "1 2,2 3,3 4"),
        ("4\\n1 3 6 10", "1 3")
    ],
    1047: [
        ("Let's take LeetCode contest", "s'teL ekat edoCteeL tsetnoc"),
        ("Mr Ding", "rM gniD")
    ],
    1048: [
        ("4\\n1 4 3 2", "4"),
        ("6\\n6 2 6 5 1 2", "9")
    ],
    1049: [
        ("aba", "true"),
        ("abca", "true")
    ],
    1050: [
        ("6\\n1 1 2 2 3 3", "3"),
        ("4\\n1 1 2 3", "2")
    ]
}

sql = []
sql.append("TRUNCATE TABLE public.problem_testcases CASCADE;")

tc_id = 1
for problem_id, cases in testcases.items():
    order = 1
    for inp, out in cases:
        # Escape single quotes in input/output data
        inp_esc = inp.replace("'", "''")
        out_esc = out.replace("'", "''")
        
        sql.append(f"INSERT INTO public.problem_testcases (id, problem_id, input_data, expected_output, order_index, token) VALUES ({tc_id}, {problem_id}, '{inp_esc}', '{out_esc}', {order}, NULL);")
        tc_id += 1
        order += 1

# Update sequence
sql.append(f"SELECT setval('public.problem_testcases_id_seq', {tc_id - 1});")

# Update total_testcase in problems table
sql.append("UPDATE public.problems p SET total_testcase = (SELECT COUNT(*) FROM public.problem_testcases pt WHERE pt.problem_id = p.id);")

with open("database/fake_testcases.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(sql))

print("Successfully generated database/fake_testcases.sql")
