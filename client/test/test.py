import sys
sys.path.append("..")
from system import system
import unittest

class TestChecker(unittest.TestCase):
    def test_checker(self):
        example = system("yourIP","yourPort")
        self.assertEqual(example.checker("yourIP"),0)
        self.assertEqual(example.checker("yourIP"),1)

if __name__ == "__main__":
    unittest.main()
