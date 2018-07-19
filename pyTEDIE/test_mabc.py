import unittest
import numpy as np

from tedie import calculate, trapezoid
class Tests(unittest.TestCase):

    def setUp(self):
        """
        Runs first, every time.
        """
        print('begin test_mabc')

    def testcalculate(self):
        data1 = np.array([[1], [0]])
        data2 = np.array([[0.5], [0.5]])
        area = calculate(data1, data2)
        self.assertEqual(0.25, area)

        data1 = np.array([[0], [0]])
        data2 = np.array([[1], [0]])
        area = calculate(data1, data2)
        self.assertEqual(0.5, area)

        data1 = np.array([[0.5], [0.5]])
        data2 = np.array([[0.5], [0.5]])
        area = calculate(data1, data2)
        self.assertEqual(0, area)

    def testtrapezoid(self):
        area = trapezoid(0,1,1,0,0,0.5,1,0.5)
        self.assertEqual(0.25, area)
        print(0.25, area)

if __name__ == '__main__':
    unittest.main()
