import sys
import random

def open_file(input_file):
	new_file = []
	with open(input_file, 'rb') as ifile:
		for line in ifile:
			if 'INSERT INTO `OrganDonorSystem`.`Recipients` (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES' in line:
				new_line = line.split('VALUES')
				insert = new_line[0]
				values = 'VALUES'
				parameters = new_line[1]
				parameters = parameters.split(',')
				parameters.insert(5, " '" + str(random.randint(18,75)) + "'")
				parameters = ','.join(parameters)
				new_line = insert + values + parameters
				new_file.append(new_line)
			else:
				new_file.append(line)
	return new_file




if __name__ == '__main__':
	ifile = sys.argv[1]
	nfile = open_file(ifile)
	with open(sys.argv[2], 'wb') as output_file:
		for k in nfile:
			output_file.write(k.strip() + '\n')
	