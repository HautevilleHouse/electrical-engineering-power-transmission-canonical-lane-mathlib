import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure PowerSystemModelPackage where
  busAdmittanceMatrix : Type u
  lineImpedances : Type v
  generatorReactances : Type w
  powerBase : Nat
  voltageLevels : Prop
  admittanceMatrixValid : Prop
  impedanceValuesPhysical : Prop

structure PowerSystemModelEvidence (M : PowerSystemModelPackage) where
  voltageLevelsClosed : M.voltageLevels
  admittanceMatrixValidClosed : M.admittanceMatrixValid
  impedanceValuesPhysicalClosed : M.impedanceValuesPhysical

def PowerSystemModelClosed (M : PowerSystemModelPackage) : Prop :=
  M.voltageLevels ∧ M.admittanceMatrixValid ∧ M.impedanceValuesPhysical

theorem power_system_model_closed_from_evidence (M : PowerSystemModelPackage)
    (E : PowerSystemModelEvidence M) : PowerSystemModelClosed M := by
  exact And.intro E.voltageLevelsClosed
    (And.intro E.admittanceMatrixValidClosed E.impedanceValuesPhysicalClosed)

end HautevilleHouse
end ElectricalEngineeringPowerTransmissionCanonicalLaneLean