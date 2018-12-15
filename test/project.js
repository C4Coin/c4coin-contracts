const Project = artifacts.require('RideshareProject')
const Token   = artifacts.require('RideshareToken')

contract('Create and mint tokens for a project', ([root,_]) => {
   let project,
       ec

   const baseline = 100

   beforeEach(async () => {
      token = await Token.new(1000)
      ec    = await EmissionsCalc.new()
      project = Project.new(root, token, ec, baseline)
   })

   it('Should mint 99 tokens', async () => {
      // Record emissions
      await project.ec.emissionsFossilFuel(1,1,1,1,1,1)

      await project.mintFromOffset(root)
   })
})
