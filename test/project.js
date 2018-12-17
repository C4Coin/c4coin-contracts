const Project = artifacts.require('RideshareProject')
const Token   = artifacts.require('RideshareToken')
const EmissionsCalc = artifacts.require('EmissionsCalc')

contract('Create and mint tokens for a project', ([root,_]) => {
   let project,
       ec

   const baseline = 100
   const tokenCap = 1000

   beforeEach(async () => {
      ec    = await EmissionsCalc.new()
      project = await Project.new(ec.address, baseline, tokenCap)
   })

   it('Should mint 99 tokens', async () => {
      // Record emissions
      let ec_ref = await EmissionsCalc.at(await project.ec())
      await ec_ref.emissionsFossilFuel(1,1,1)

      await project.mintFromOffset(root)

      let token = await Token.at(await project.co2kn())
      assert( (await token.totalSupply()).toNumber() == 99 )
   })
})
