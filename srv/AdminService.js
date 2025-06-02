const cds = require('@sap/cds');

class AdminService extends cds.ApplicationService {
    init() {
        //get Entities 
        const { Equipments, EquipmentTypes } = this.entities;

         
        this.before('UPDATE', Equipments.drafts, async (req) => {
            debugger
            try {
                let tx = cds.tx(req);
                if (req.data?.type_code) {
                    let typecode = req.data?.type_code;
                    let oEquipmentData = await SELECT.one.from(EquipmentTypes).where({code:typecode})
                    if(!oEquipmentData){
                        return req.error(404, 'No data found');
                    }

                    req.data.manufacturing = oEquipmentData.manufacture;
                }
            } catch (error) {
                return req.error(404, 'No data found');
            }

        });
        return super.init();
    }
}

module.exports = AdminService;