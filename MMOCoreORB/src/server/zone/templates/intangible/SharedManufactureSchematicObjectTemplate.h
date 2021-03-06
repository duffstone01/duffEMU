/*
 * SharedManufactureSchematicObjectTemplate.h
 *
 *  Created on: 06/05/2010
 *      Author: victor
 */

#ifndef SHAREDMANUFACTURESCHEMATICOBJECTTEMPLATE_H_
#define SHAREDMANUFACTURESCHEMATICOBJECTTEMPLATE_H_


#include "../SharedIntangibleObjectTemplate.h"

class SharedManufactureSchematicObjectTemplate : public SharedIntangibleObjectTemplate {

public:
	SharedManufactureSchematicObjectTemplate() {

	}

	~SharedManufactureSchematicObjectTemplate() {

	}

	void readObject(IffStream* iffStream) {
		uint32 nextType = iffStream->getNextFormType();

		if (nextType != 'SMSC') {
			//Logger::console.error("expecting SHOT got " + String::hexvalueOf((int)nextType));

			SharedIntangibleObjectTemplate::readObject(iffStream);

			return;
		}

		iffStream->openForm('SMSC');

		uint32 derv = iffStream->getNextFormType();

		if (derv == 'DERV') {
			loadDerv(iffStream);

			derv = iffStream->getNextFormType();
		}

		/*while (derv != 0) {
					if (derv != '
				}*/

		iffStream->openForm(derv);

		try {
			//parseFileData(iffStream);
		} catch (Exception& e) {
			String msg;
			msg += "exception caught parsing file data ->";
			msg += e.getMessage();

			Logger::console.error(msg);
		}

		iffStream->closeForm(derv);

		if (iffStream->getRemainingSubChunksNumber() > 0) {
			readObject(iffStream);
		}

		iffStream->closeForm('SMSC');
	}
};

#endif /* SHAREDMANUFACTURESCHEMATICOBJECTTEMPLATE_H_ */
