import unittest
import numpy as np
from mabc import MABC
class TestMABC(unittest.TestCase):

    def setUp(self):
        """
        Runs first, every time.
        """
        print('Testing MABC')

    def testcalculate(self):
        data1 = np.array([[1], [0]])
        data2 = np.array([[0.5], [0.5]])
        mabc = MABC()
        area = mabc.calculate(data1, data2)
        self.assertEqual(0.25, area)

    def testtrapezoid(self):
        mabc = MABC()
        area = mabc.trapezoid(0,1,1,0,0,0.5,1,0.5)
        self.assertEqual(0.25, area)

if __name__ == '__main__':
    unittest.main()
