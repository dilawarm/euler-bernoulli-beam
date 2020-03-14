import math

def y(x):
    return (-42.3792/(24*(1.3*10**10)* 6.75*(10**-7)))*(x**2)*((x**2)-(4*2*x)+(6*(2**2)))

def printMatrix(array):
    for i in array:
        print(i)

#calculating 1/h^4 * A * ye
def calculate(A, y):
    result = []

    for i in range(0, len(A)):
        for j in range(0, len(A[i])):
            A[i][j]*=(1/(0.2**4))
            #print(A[i][j])
    

    for i in range(0, len(A)):
        sum = 0
        for j in range(0, len(A[i])):
            #print(y[i])
            sum+= A[i][j]*y[j]
        result.append(sum)
    return result


ye = []

for i in range(1, 11):
    ye.append(y(i*0.2))
    print(y(i*0.2))

A = []

#A-matrisen
A.append([16.0,-9.0,8.0/3.0,-1.0/4.0,0,0,0,0,0,0])
A.append([-4,6,-4,1,0,0,0,0,0,0])
A.append([1,-4,6,-4,1,0,0,0,0,0])
A.append([0,1,-4,6,-4,1,0,0,0,0])
A.append([0,0,1,-4,6,-4,1,0,0,0])
A.append([0,0,0,1,-4,6,-4,1,0,0])
A.append([0,0,0,0,1,-4,6,-4,1,0])
A.append([0,0,0,0,0,1,-4,6,-4,1])
A.append([0,0,0,0,0,0,16/17,-60/17,72/17,-28/17])
A.append([0,0,0,0,0,0,-12/17,96/17,-156/17,72/17])


#printMatrix(calculate(A, ye))

Aye = calculate(A,ye)
res = []

#f/EI
fel = -42.3792/(1.3*(10**10)*6.75*(10**-7))

#lager vektor for differanse mellom f/EL * [1, 1, ... 1]^T og 1/h^4 Aye
for i in range(0, 10):
    res.append(abs(fel - Aye[i]))

for i in res:
    print(i)

print(res[4]/fel)
print(abs(res[4]/fel)/(2**-52))


#printMatrix(A)