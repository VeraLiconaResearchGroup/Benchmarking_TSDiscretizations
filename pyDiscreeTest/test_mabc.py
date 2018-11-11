import unittest
import numpy as np

from discreetest import calculateMABC, trapezoid
class Tests(unittest.TestCase):

    def setUp(self):
        """
        Runs first, every time.
        """
        print('begin test_mabc')

    def testcalculateMABC(self):
        data1 = np.array([[1], [0]])
        data2 = np.array([[0.5], [0.5]])
        MABC = calculateMABC(data1, data2)
        self.assertEqual(0.25, MABC * 2)

        data1 = np.array([[0], [0]])
        data2 = np.array([[1], [0]])
        MABC = calculateMABC(data1, data2)
        self.assertEqual(0.5, MABC * 2)

        data1 = np.array([[0.5], [0.5]])
        data2 = np.array([[0.5], [0.5]])
        MABC = calculateMABC(data1, data2)
        self.assertEqual(0, MABC * 2)

    def testtrapezoid(self):
        MABC = trapezoid(0,1,1,0,0,0.5,1,0.5)
        self.assertEqual(0.25, MABC)
        print(0.25, MABC)

if __name__ == '__main__':
    unittest.main()
