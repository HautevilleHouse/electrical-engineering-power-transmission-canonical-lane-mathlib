import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure PowerSystem where
  carrier : Type
  topology : TopologicalSpace carrier

structure PowerTransmissionAdmittedObject where
  system : PowerSystem
  stableOperation : Prop
  controlsEffective : Prop
  conclusion : stableOperation ∧ controlsEffective

structure AdmissibleClass where
  object : PowerTransmissionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.stableOperation ∧ A.object.controlsEffective) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse