const Project = artifacts.require('RideshareProject')
const Token   = artifacts.require('RideshareToken')
const EmissionsCalc = artifacts.require('EmissionsCalc')

contract('Create and mint tokens for a project', ([root,_]) => {
   let project,
       ec

   const baseline = 100

   beforeEach(async () => {
      token = await Token.new(1000)
      ec    = await EmissionsCalc.new()
      project = await Project.new(token.address, ec.address, baseline)
   })

   it('Should mint 99 tokens', async () => {
      // Record emissions
      let ec_ref = await EmissionsCalc.at(await project.ec())
      await ec_ref.emissionsFossilFuel(1,1,1)

      await project.mintFromOffset(root)
   })
})
